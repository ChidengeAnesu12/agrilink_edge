import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/app_error.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../routes/app_router.dart';
import '../controllers/login_controller.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/phone_input_field.dart';

/// SCREEN 005 — Login
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _phoneController = TextEditingController();
  String _countryCode = '+263';
  String _phoneNumber = '';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    await ref.read(loginControllerProvider.notifier).sendOtp(
          phoneNumber: _phoneNumber,
          countryCode: _countryCode,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginControllerProvider, (_, next) {
      if (next is LoginOtpSent) {
        context.goNamed(
          AppRoutes.otpVerification,
          queryParameters: {'phone': next.phoneNumber},
        );
      }
      if (next is LoginSuccess) {
        context.goNamed(AppRoutes.dashboard);
      }
    });

    final loginState = ref.watch(loginControllerProvider);
    final bool isLoading = loginState is LoginLoading;
    final AppError? error =
        loginState is LoginError ? loginState.error : null;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPaddingMobile,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xxl),
              const AuthHeaderWidget(
                title: 'Sign In',
                subtitle:
                    'Enter your phone number to receive a one-time password.',
                iconData: Icons.phone_android_rounded,
              ),
              const SizedBox(height: AppSpacing.xxxl),
              PhoneInputField(
                controller: _phoneController,
                selectedCountryCode: _countryCode,
                onCountryCodeChanged: (c) =>
                    setState(() => _countryCode = c),
                onChanged: (v) => _phoneNumber = v,
                errorText: error is ValidationError &&
                        error.field == 'phoneNumber'
                    ? error.message
                    : null,
                enabled: !isLoading,
              ),
              if (error != null && error is! ValidationError) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  error.message,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchTarget,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _sendOtp,
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.onPrimary,
                          ),
                        )
                      : const Text('Send OTP'),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchTarget,
                child: OutlinedButton(
                  onPressed: isLoading
                      ? null
                      : () => ref
                          .read(loginControllerProvider.notifier)
                          .signInAsGuest(),
                  child: const Text('Continue as Guest'),
                ),
              ),
              const SizedBox(height: AppSpacing.xxxl),
              Center(
                child: Text(
                  'By signing in you agree to our Terms of Service\nand Privacy Policy.',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.onSurfaceMediumLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
