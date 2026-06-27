import '../../../../core/errors/app_error.dart';
import '../repositories/auth_repository.dart';

/// Sends a one-time password to the user's phone number.
final class SendOtpUseCase {
  const SendOtpUseCase({required AuthRepository repository})
      : _repository = repository;

  final AuthRepository _repository;

  Future<({AppError? error})> call({
    required String phoneNumber,
    required String countryCode,
  }) {
    if (phoneNumber.trim().isEmpty) {
      return Future.value((
        error: const ValidationError(
          message: 'Phone number is required.',
          field: 'phoneNumber',
        ),
      ),);
    }
    if (phoneNumber.trim().length < 7) {
      return Future.value((
        error: const ValidationError(
          message: 'Enter a valid phone number.',
          field: 'phoneNumber',
        ),
      ),);
    }
    return _repository.sendOtp(
      phoneNumber: phoneNumber.trim(),
      countryCode: countryCode,
    );
  }
}
