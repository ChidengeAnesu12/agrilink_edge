import 'package:go_router/go_router.dart';

import '../../../routes/app_router.dart';
import '../presentation/pages/farm_wizard_page.dart';
import '../presentation/pages/farmer_registration_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/onboarding_page.dart';
import '../presentation/pages/otp_verification_page.dart';

/// All authentication and onboarding routes.
final List<GoRoute> authRoutes = [
  GoRoute(
    path: '/onboarding',
    name: AppRoutes.onboarding,
    builder: (_, __) => const OnboardingPage(),
  ),
  GoRoute(
    path: '/login',
    name: AppRoutes.login,
    builder: (_, __) => const LoginPage(),
  ),
  GoRoute(
    path: '/otp',
    name: AppRoutes.otpVerification,
    builder: (_, state) {
      final phone = state.uri.queryParameters['phone'] ?? '';
      return OtpVerificationPage(phoneNumber: phone);
    },
  ),
  GoRoute(
    path: '/register/farmer',
    name: AppRoutes.farmerRegistration,
    builder: (_, state) {
      final userId = state.uri.queryParameters['userId'] ?? '';
      return FarmerRegistrationPage(userId: userId);
    },
  ),
  GoRoute(
    path: '/register/farm',
    name: AppRoutes.farmWizard,
    builder: (_, state) {
      final userId = state.uri.queryParameters['userId'] ?? '';
      return FarmWizardPage(userId: userId);
    },
  ),
];
