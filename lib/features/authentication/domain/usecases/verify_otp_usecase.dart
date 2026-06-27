import '../../../../core/errors/app_error.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Verifies a one-time password and returns an authenticated user.
final class VerifyOtpUseCase {
  const VerifyOtpUseCase({required AuthRepository repository})
      : _repository = repository;

  final AuthRepository _repository;

  Future<({UserEntity? user, AppError? error})> call({
    required String phoneNumber,
    required String otp,
  }) {
    if (otp.length != 6) {
      return Future.value((
        user: null,
        error: const ValidationError(
          message: 'OTP must be 6 digits.',
          field: 'otp',
        ),
      ),);
    }
    return _repository.verifyOtp(phoneNumber: phoneNumber, otp: otp);
  }
}
