/// AgriLink Edge — Application Error Type System
///
/// Sealed hierarchy covering every possible error category.
/// Users always receive actionable, human-readable messages.
sealed class AppError {
  const AppError({required this.message});
  final String message;
}

final class OfflineError extends AppError {
  const OfflineError()
      : super(
          message:
              'No internet connection. Your data is saved and will sync when connected.',
        );
}

final class NetworkError extends AppError {
  const NetworkError({required super.message});
}

final class ValidationError extends AppError {
  const ValidationError({required super.message, required this.field});
  final String field;
}

final class PermissionError extends AppError {
  const PermissionError({required super.message, required this.permission});
  final String permission;
}

final class BridgeError extends AppError {
  const BridgeError({required super.message});
}

final class AuthError extends AppError {
  const AuthError({required super.message});
}

final class UnexpectedError extends AppError {
  const UnexpectedError({required super.message});
}
