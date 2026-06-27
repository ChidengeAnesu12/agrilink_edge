import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/presentation/pages/splash_page.dart';
import '../features/authentication/routes/auth_routes.dart';
import '../features/dashboard/routes/dashboard_routes.dart';

abstract final class AppRoutes {
  static const String splash = 'splash';
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String register = 'register';
  static const String otpVerification = 'otp-verification';
  static const String farmerRegistration = 'farmer-registration';
  static const String farmWizard = 'farm-wizard';
  static const String dashboard = 'dashboard';
  static const String farm = 'farm';
  static const String farmCreate = 'farm-create';
  static const String farmDetails = 'farm-details';
  static const String fieldList = 'field-list';
  static const String fieldDetails = 'field-details';
  static const String fieldCreate = 'field-create';
  static const String cropManagement = 'crop-management';
  static const String cropDetails = 'crop-details';
  static const String activities = 'activities';
  static const String expenses = 'expenses';
  static const String equipment = 'equipment';
  static const String workers = 'workers';
  static const String scan = 'scan';
  static const String camera = 'camera';
  static const String aiProcessing = 'ai-processing';
  static const String diagnosisResult = 'diagnosis-result';
  static const String diseaseDetails = 'disease-details';
  static const String treatmentGuide = 'treatment-guide';
  static const String diagnosisHistory = 'diagnosis-history';
  static const String savedReports = 'saved-reports';
  static const String weather = 'weather';
  static const String maps = 'maps';
  static const String heatMap = 'heat-map';
  static const String marketplace = 'marketplace';
  static const String marketPrices = 'market-prices';
  static const String productDetails = 'product-details';
  static const String nearbyMarkets = 'nearby-markets';
  static const String sellProduct = 'sell-product';
  static const String myListings = 'my-listings';
  static const String orders = 'orders';
  static const String community = 'community';
  static const String postDetails = 'post-details';
  static const String createPost = 'create-post';
  static const String groups = 'groups';
  static const String events = 'events';
  static const String messages = 'messages';
  static const String notifications = 'notifications';
  static const String analytics = 'analytics';
  static const String reports = 'reports';
  static const String profile = 'profile';
  static const String editProfile = 'edit-profile';
  static const String settings = 'settings';
  static const String language = 'language';
  static const String accessibility = 'accessibility';
  static const String modelManager = 'model-manager';
  static const String storageManagement = 'storage-management';
  static const String help = 'help';
  static const String about = 'about';
  static const String privacyPolicy = 'privacy-policy';
  static const String developerOptions = 'developer-options';
  static const String offlineCenter = 'offline-center';
  static const String voiceAssistant = 'voice-assistant';
  static const String achievements = 'achievements';
  static const String learningCenter = 'learning-center';
}

final appRouterProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    errorBuilder: (context, state) =>
        _RouteErrorPage(error: state.error),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.splash,
        builder: (_, __) => const SplashPage(),
      ),
      ...authRoutes,
      ...dashboardRoutes,
    ],
  ),
);

class _RouteErrorPage extends StatelessWidget {
  const _RouteErrorPage({this.error});
  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded, size: 64),
            const SizedBox(height: 16),
            Text(
              'Route not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              error?.toString() ?? 'Unknown routing error.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
