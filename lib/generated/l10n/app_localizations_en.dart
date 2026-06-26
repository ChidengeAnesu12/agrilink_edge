// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'AgriLink Edge';

  @override
  String get appTagline => 'AI-Powered Agriculture for Africa';

  @override
  String get splashInitializing => 'Initializing...';

  @override
  String get splashLoadingAi => 'Loading AI models...';

  @override
  String get splashLoadingDatabase => 'Preparing database...';

  @override
  String get splashReady => 'Ready';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboarding1Title => 'Welcome to AgriLink Edge';

  @override
  String get onboarding1Description =>
      'The most advanced offline-first agricultural intelligence platform in Africa.';

  @override
  String get onboarding2Title => 'Works Without Internet';

  @override
  String get onboarding2Description =>
      'AI diagnosis, farm management, and weather forecasts — all available offline.';

  @override
  String get onboarding3Title => 'Diagnose Crop Diseases';

  @override
  String get onboarding3Description =>
      'Point your camera at any crop. Our AI identifies diseases in seconds.';

  @override
  String get onboarding4Title => 'Farmer-to-Farmer Network';

  @override
  String get onboarding4Description =>
      'Connect with nearby farmers even without internet using mesh networking.';

  @override
  String get onboarding5Title => 'Live Weather Intelligence';

  @override
  String get onboarding5Description =>
      'Hyperlocal weather forecasts and spray advisories tailored to your farm.';

  @override
  String get onboarding6Title => 'Find Markets and Buyers';

  @override
  String get onboarding6Description =>
      'Get real-time prices, nearby buyers, and sell your produce directly.';

  @override
  String get onboarding7Title => 'Government Collaboration';

  @override
  String get onboarding7Description =>
      'Connect with AGRITEX extension officers and access government support.';

  @override
  String get onboarding8Title => 'Allow Permissions';

  @override
  String get onboarding8Description =>
      'AgriLink Edge needs camera, location, and storage to give you the best experience.';

  @override
  String get loginTitle => 'Sign In';

  @override
  String get loginPhoneLabel => 'Phone Number';

  @override
  String get loginEmailLabel => 'Email Address';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginButton => 'Sign In';

  @override
  String get loginBiometricButton => 'Use Biometrics';

  @override
  String get loginGuestButton => 'Continue as Guest';

  @override
  String get loginRegisterPrompt => 'Don\'t have an account?';

  @override
  String get loginRegisterLink => 'Register';

  @override
  String dashboardGreetingMorning(String name) {
    return 'Good morning, $name';
  }

  @override
  String dashboardGreetingAfternoon(String name) {
    return 'Good afternoon, $name';
  }

  @override
  String dashboardGreetingEvening(String name) {
    return 'Good evening, $name';
  }

  @override
  String get dashboardFarmHealth => 'Farm Health';

  @override
  String get dashboardQuickScan => 'Scan Crop';

  @override
  String get dashboardWeather => 'Weather';

  @override
  String get dashboardMarketPrices => 'Market Prices';

  @override
  String get offlineBadge => 'Offline';

  @override
  String get offlineMessage =>
      'You are offline. Data is saved locally and will sync when connected.';

  @override
  String get syncPending => 'Syncing...';

  @override
  String get syncComplete => 'Synced';

  @override
  String get syncFailed => 'Sync failed. Will retry automatically.';

  @override
  String get errorGeneric => 'Something unexpected happened. Please try again.';

  @override
  String get errorNetwork =>
      'No internet connection. Check your network and try again.';

  @override
  String get errorCameraPermission =>
      'Camera permission is required to scan crops. Enable it in Settings.';

  @override
  String get errorLocationPermission =>
      'Location permission is required for map features. Enable it in Settings.';

  @override
  String get errorAiInference =>
      'AI analysis could not be completed. Ensure the crop is well-lit and try again.';

  @override
  String get errorStorageFull =>
      'Device storage is full. Free up space and try again.';

  @override
  String get buttonRetry => 'Try Again';

  @override
  String get buttonOpenSettings => 'Open Settings';

  @override
  String get buttonCancel => 'Cancel';

  @override
  String get buttonConfirm => 'Confirm';

  @override
  String get buttonSave => 'Save';

  @override
  String get buttonDelete => 'Delete';

  @override
  String get buttonShare => 'Share';

  @override
  String get buttonExport => 'Export';

  @override
  String get loadingDefault => 'Loading...';

  @override
  String get emptyDiagnosesTitle => 'No diagnoses yet';

  @override
  String get emptyDiagnosesDescription =>
      'Scan a crop to get your first AI diagnosis.';

  @override
  String get emptyDiagnosesAction => 'Scan Crop';

  @override
  String get emptyFarmsTitle => 'No farms added';

  @override
  String get emptyFarmsDescription =>
      'Add your first farm to start managing your crops.';

  @override
  String get emptyFarmsAction => 'Add Farm';

  @override
  String get emptyNotificationsTitle => 'No notifications';

  @override
  String get emptyNotificationsDescription =>
      'You are up to date. Check back later.';

  @override
  String get emptyPostsTitle => 'No posts yet';

  @override
  String get emptyPostsDescription =>
      'Be the first to share something with your community.';

  @override
  String get emptyPostsAction => 'Create Post';
}
