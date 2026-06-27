import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_error.dart';
import '../../domain/entities/user_entity.dart';
import '../providers/auth_providers.dart';

sealed class OtpState {
  const OtpState();
}

final class OtpWaiting extends OtpState {
  const OtpWaiting({required this.secondsLeft});
  final int secondsLeft;
}

final class OtpLoading extends OtpState {
  const OtpLoading();
}

final class OtpSuccess extends OtpState {
  const OtpSuccess({required this.user});
  final UserEntity user;
}

final class OtpError extends OtpState {
  const OtpError({required this.error, required this.secondsLeft});
  final AppError error;
  final int secondsLeft;
}

final class OtpResendReady extends OtpState {
  const OtpResendReady();
}

class OtpController extends Notifier<OtpState> {
  static const int _cooldown = 60;
  Timer? _timer;
  int _secondsLeft = _cooldown;

  @override
  OtpState build() {
    ref.onDispose(() => _timer?.cancel());
    _startCountdown();
    return OtpWaiting(secondsLeft: _secondsLeft);
  }

  void _startCountdown() {
    _secondsLeft = _cooldown;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsLeft--;
      if (_secondsLeft <= 0) {
        timer.cancel();
        state = const OtpResendReady();
      } else {
        if (state is OtpWaiting) {
          state = OtpWaiting(secondsLeft: _secondsLeft);
        } else if (state is OtpError) {
          state = OtpError(
            error: (state as OtpError).error,
            secondsLeft: _secondsLeft,
          );
        }
      }
    });
  }

  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    _timer?.cancel();
    state = const OtpLoading();
    final result = await ref.read(verifyOtpUseCaseProvider)(
      phoneNumber: phoneNumber,
      otp: otp,
    );
    if (result.error != null) {
      state = OtpError(error: result.error!, secondsLeft: _secondsLeft);
      _startCountdown();
      return;
    }
    state = OtpSuccess(user: result.user!);
  }

  Future<void> resendOtp({
    required String phoneNumber,
    required String countryCode,
  }) async {
    await ref.read(sendOtpUseCaseProvider)(
      phoneNumber: phoneNumber,
      countryCode: countryCode,
    );
    _startCountdown();
    state = OtpWaiting(secondsLeft: _secondsLeft);
  }
}

final otpControllerProvider =
    NotifierProvider<OtpController, OtpState>(OtpController.new);
