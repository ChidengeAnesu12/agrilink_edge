import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_error.dart';
import '../../domain/entities/user_entity.dart';
import '../providers/auth_providers.dart';

sealed class LoginState {
  const LoginState();
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class LoginLoading extends LoginState {
  const LoginLoading();
}

final class LoginOtpSent extends LoginState {
  const LoginOtpSent({required this.phoneNumber});
  final String phoneNumber;
}

final class LoginSuccess extends LoginState {
  const LoginSuccess({required this.user});
  final UserEntity user;
}

final class LoginError extends LoginState {
  const LoginError({required this.error});
  final AppError error;
}

class LoginController extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginInitial();

  Future<void> sendOtp({
    required String phoneNumber,
    required String countryCode,
  }) async {
    state = const LoginLoading();
    final result = await ref.read(sendOtpUseCaseProvider)(
      phoneNumber: phoneNumber,
      countryCode: countryCode,
    );
    if (result.error != null) {
      state = LoginError(error: result.error!);
      return;
    }
    state = LoginOtpSent(phoneNumber: '$countryCode$phoneNumber');
  }

  Future<void> signInAsGuest() async {
    state = const LoginLoading();
    final result = await ref.read(authRepositoryProvider).signInAsGuest();
    if (result.error != null) {
      state = LoginError(error: result.error!);
      return;
    }
    state = LoginSuccess(user: result.user!);
  }

  void reset() => state = const LoginInitial();
}

final loginControllerProvider =
    NotifierProvider<LoginController, LoginState>(LoginController.new);
