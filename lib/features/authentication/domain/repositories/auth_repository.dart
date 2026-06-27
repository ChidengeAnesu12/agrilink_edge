import '../../../../core/errors/app_error.dart';
import '../entities/farmer_entity.dart';
import '../entities/user_entity.dart';

/// Contract for all authentication operations.
/// The data layer implements this. Presentation depends only on this contract.
abstract interface class AuthRepository {
  Future<({AppError? error})> sendOtp({
    required String phoneNumber,
    required String countryCode,
  });

  Future<({UserEntity? user, AppError? error})> verifyOtp({
    required String phoneNumber,
    required String otp,
  });

  Future<({FarmerEntity? farmer, AppError? error})> registerFarmer({
    required FarmerEntity farmer,
  });

  Future<UserEntity?> getCurrentUser();

  Future<void> signOut();

  Future<({UserEntity? user, AppError? error})> signInAsGuest();

  Future<bool> isBiometricAvailable();

  Future<({UserEntity? user, AppError? error})> authenticateWithBiometrics();
}
