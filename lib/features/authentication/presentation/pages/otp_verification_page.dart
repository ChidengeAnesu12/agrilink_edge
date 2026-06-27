import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../routes/app_router.dart';
import '../controllers/otp_controller.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/otp_input_field.dart';

/// SCREEN 006 — OTP Verification
class OtpVerificationPage extends ConsumerWidget {
  const OtpVerificationPage({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<OtpState>(otpControllerProvider, (_, next) {
      if (next is OtpSuccess) {
        if (next.user.isOnboardingComplete) {
          context.goNamed(AppRoutes.dashboard);
        } else {
          context.goNamed(
            AppRoutes.farmerRegistration,
            queryParameters: {'userId': next.user.id},
          );
        }
      }
    });

    final state = ref.watch(otpControllerProvider);
    final bool isLoading = state is OtpLoading;

    final int secondsLeft = switch (state) {
      OtpWaiting(:final secondsLeft) => secondsLeft,
      OtpError(:final secondsLeft) => secondsLeft,
      _ => 0,
    };

    final bool canResend = state is OtpResendReady;
    final String? errorMsg =
        state is OtpError ? state.error.message : null;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPaddingMobile,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.lg),
              AuthHeaderWidget(
                title: 'Enter OTP',
                subtitle: 'We sent a 6-digit code to $phoneNumber',
                iconData: Icons.sms_rounded,
              ),
              const SizedBox(height: AppSpacing.xxxl),
              OtpInputField(
                isLoading: isLoading,
                hasError: errorMsg != null,
                onCompleted: (otp) => ref
                    .read(otpControllerProvider.notifier)
                    .verifyOtp(
                      phoneNumber: phoneNumber,
                      otp: otp,
                    ),
              ),
              if (errorMsg != null) ...[
                const SizedBox(height: AppSpacing.md),
                Center(
                  child: Text(
                    errorMsg,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.xxl),
              Center(
                child: canResend
                    ? TextButton(
                        onPressed: () => ref
                            .read(otpControllerProvider.notifier)
                            .resendOtp(
                              phoneNumber: phoneNumber,
                              countryCode: '',
                            ),
                        child: const Text('Resend OTP'),
                      )
                    : Text(
                        'Resend in ${secondsLeft}s',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.onSurfaceMediumLight,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
