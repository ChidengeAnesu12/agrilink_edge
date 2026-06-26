// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Shona (`sn`).
class SSn extends S {
  SSn([String locale = 'sn']) : super(locale);

  @override
  String get appName => 'AgriLink Edge';

  @override
  String get appTagline =>
      'Hukuchengeta Hwemarudzi Nekuchenjera kweComputer muAfrica';

  @override
  String get splashInitializing => 'Kutangisa...';

  @override
  String get splashLoadingAi => 'Kutengera AI models...';

  @override
  String get splashLoadingDatabase => 'Kugadzirira database...';

  @override
  String get splashReady => 'Takagadzirira';

  @override
  String get onboardingSkip => 'Pfuurira';

  @override
  String get onboardingNext => 'Mberi';

  @override
  String get onboardingGetStarted => 'Tanga';

  @override
  String get onboarding1Title => 'Mauya kuAgriLink Edge';

  @override
  String get onboarding1Description =>
      'Nzvimbo yepamusoro inoshanda pasina intaneti yekuchengetedza kurima muAfrica.';

  @override
  String get onboarding2Title => 'Inoshanda Pasina Intaneti';

  @override
  String get onboarding2Description =>
      'Kuongorora zvirwere, kuchengetedza purazi, uye mamiriro ekunze — zvose zvinoshanda pasina intaneti.';

  @override
  String get onboarding3Title => 'Ongorora Zvirwere Zvemhero';

  @override
  String get onboarding3Description =>
      'Rangaridza kamera yako pamhero ipi neipi. AI yedu inoona zvirwere mwedzi uno.';

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
  String get loginTitle => 'Pinda';

  @override
  String get loginPhoneLabel => 'Nhamba yeRunhare';

  @override
  String get loginEmailLabel => 'Kero ye-Email';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginButton => 'Pinda';

  @override
  String get loginBiometricButton => 'Shandisa Biometrics';

  @override
  String get loginGuestButton => 'Pinda SeMushanyi';

  @override
  String get loginRegisterPrompt => 'Huna account?';

  @override
  String get loginRegisterLink => 'Nyoresa';

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
  String get offlineBadge => 'Hapana Intaneti';

  @override
  String get offlineMessage =>
      'Hapana intaneti. Ruzivo rwakachengetwa uye ruchagoverwa kana yakabatana.';

  @override
  String get syncPending => 'Kugoverwa...';

  @override
  String get syncComplete => 'Yakagoverwa';

  @override
  String get syncFailed => 'Kugoverwa kwakundikana. Kuzojaridzwa zvakare.';

  @override
  String get errorGeneric => 'Chimwe chinhu chakaitika. Ndapota jaridzazve.';

  @override
  String get errorNetwork =>
      'Hapana intaneti. Tarisa netiweki yako uye ujaridzezve.';

  @override
  String get errorCameraPermission =>
      'Mvumo yekamera inodikanwa kuongorora mhero. Iite mushure meSettings.';

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
  String get buttonRetry => 'Jaridzazve';

  @override
  String get buttonOpenSettings => 'Open Settings';

  @override
  String get buttonCancel => 'Kanzura';

  @override
  String get buttonConfirm => 'Simbisa';

  @override
  String get buttonSave => 'Chengetedza';

  @override
  String get buttonDelete => 'Dzima';

  @override
  String get buttonShare => 'Govera';

  @override
  String get buttonExport => 'Export';

  @override
  String get loadingDefault => 'Kuvhura...';

  @override
  String get emptyDiagnosesTitle => 'Hapana ongororo dzakaitwa';

  @override
  String get emptyDiagnosesDescription =>
      'Ongorora mhero kuwana ongororo yako yekutanga yeAI.';

  @override
  String get emptyDiagnosesAction => 'Ongorora Mhero';

  @override
  String get emptyFarmsTitle => 'Hapana mapurazi akawedzerwa';

  @override
  String get emptyFarmsDescription =>
      'Wedzera purazi rako rekutanga kutanga kukudza mbesa dzako.';

  @override
  String get emptyFarmsAction => 'Wedzera Purazi';

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
