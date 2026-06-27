import '../../../../core/errors/app_error.dart';
import '../../bridge/auth_bridge.dart';
import '../../domain/entities/farmer_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/farmer_model.dart';
import '../models/user_model.dart';

/// Implements [AuthRepository] by routing all calls through [AuthBridge].
final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required AuthBridge bridge}) : _bridge = bridge;

  final AuthBridge _bridge;

  @override
  Future<({AppError? error})> sendOtp({
    required String phoneNumber,
    required String countryCode,
  }) async {
    try {
      final result = await _bridge.sendOtp(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
      );
      if (result.error != null) {
        return (error: AuthError(message: result.error!));
      }
      return (error: null);
    } on Exception catch (e) {
      return (error: UnexpectedError(message: e.toString()));
    }
  }

  @override
  Future<({UserEntity? user, AppError? error})> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      final result = await _bridge.verifyOtp(
        phoneNumber: phoneNumber,
        otp: otp,
      );
      if (result.error != null) {
        return (user: null, error: AuthError(message: result.error!));
      }
      if (result.userData == null) {
        return (
          user: null,
          error: const UnexpectedError(message: 'No user data returned.'),
        );
      }
      return (
        user: UserModel.fromMap(result.userData!).toEntity(),
        error: null,
      );
    } on Exception catch (e) {
      return (user: null, error: UnexpectedError(message: e.toString()));
    }
  }

  @override
  Future<({FarmerEntity? farmer, AppError? error})> registerFarmer({
    required FarmerEntity farmer,
  }) async {
    try {
      final result = await _bridge.registerFarmer(
        farmerData: FarmerModel.fromEntity(farmer).toMap(),
      );
      if (result.error != null) {
        return (farmer: null, error: BridgeError(message: result.error!));
      }
      if (result.farmerData == null) {
        return (
          farmer: null,
          error:
              const UnexpectedError(message: 'No farmer data returned.'),
        );
      }
      return (
        farmer: FarmerModel.fromMap(result.farmerData!).toEntity(),
        error: null,
      );
    } on Exception catch (e) {
      return (farmer: null, error: UnexpectedError(message: e.toString()));
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final session = await _bridge.getStoredSession();
      if (session == null) return null;
      return UserModel.fromMap(session).toEntity();
    } on Exception {
      return null;
    }
  }

  @override
  Future<void> signOut() => _bridge.clearSession();

  @override
  Future<({UserEntity? user, AppError? error})> signInAsGuest() async {
    const guest = UserEntity(
      id: 'guest',
      phoneNumber: '',
      role: 'guest',
      isOnboardingComplete: true,
    );
    return (user: guest, error: null);
  }

  @override
  Future<bool> isBiometricAvailable() => _bridge.checkBiometricAvailable();

  @override
  Future<({UserEntity? user, AppError? error})>
      authenticateWithBiometrics() async {
    try {
      final result = await _bridge.authenticateWithBiometrics();
      if (result.error != null) {
        return (user: null, error: AuthError(message: result.error!));
      }
      if (result.userData == null) {
        return (
          user: null,
          error: const AuthError(
            message: 'Biometric authentication failed.',
          ),
        );
      }
      return (
        user: UserModel.fromMap(result.userData!).toEntity(),
        error: null,
      );
    } on Exception catch (e) {
      return (user: null, error: UnexpectedError(message: e.toString()));
    }
  }
}
