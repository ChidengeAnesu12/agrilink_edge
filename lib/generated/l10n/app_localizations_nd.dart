// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for North Ndebele (`nd`).
class SNd extends S {
  SNd([String locale = 'nd']) : super(locale);

  @override
  String get appName => 'AgriLink Edge';

  @override
  String get appTagline => 'Ukulima Okuqedwe i-AI e-Afrika';

  @override
  String get splashInitializing => 'Iyaqala...';

  @override
  String get splashLoadingAi => 'Ilayisha imodeli ze-AI...';

  @override
  String get splashLoadingDatabase => 'Ilungisa idatabase...';

  @override
  String get splashReady => 'Ilungele';

  @override
  String get onboardingSkip => 'Yeqa';

  @override
  String get onboardingNext => 'Okulandelayo';

  @override
  String get onboardingGetStarted => 'Qala';

  @override
  String get onboarding1Title => 'Wamukelekile ku-AgriLink Edge';

  @override
  String get onboarding1Description =>
      'Inkundla ephambili yokulima esebenza ngaphandle kwe-intanethi e-Afrika.';

  @override
  String get onboarding2Title => 'Isebenza Ngaphandle kwe-Intanethi';

  @override
  String get onboarding2Description =>
      'Ukuhlolwa kwezifo, ukulawula ipulazi, kanye nezimo zezulu — konke kuyatholakala ngaphandle kwe-intanethi.';

  @override
  String get onboarding3Title => 'Hlola Izifo Zezitshalo';

  @override
  String get onboarding3Description =>
      'Bhekisa ikhamera yakho kusitshalo noma yisiphi. I-AI yethu ihlonza izifo ngamahlatshana.';

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
  String get loginTitle => 'Ngena';

  @override
  String get loginPhoneLabel => 'Inombolo Yocingo';

  @override
  String get loginEmailLabel => 'Ikheli le-Email';

  @override
  String get loginPasswordLabel => 'Iphasiwedi';

  @override
  String get loginButton => 'Ngena';

  @override
  String get loginBiometricButton => 'Sebenzisa Izimpawu Zomzimba';

  @override
  String get loginGuestButton => 'Qhubeka Njengesihambi';

  @override
  String get loginRegisterPrompt => 'Awunayo i-akhawunti?';

  @override
  String get loginRegisterLink => 'Bhalisa';

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
  String get offlineBadge => 'Awulakho u-Intanethi';

  @override
  String get offlineMessage =>
      'Awulakho u-intanethi. Idatha ilondoloziwe futhi izahambiselwa uma uxhumekile.';

  @override
  String get syncPending => 'Ihambiselwa...';

  @override
  String get syncComplete => 'Ihambiselwe';

  @override
  String get syncFailed =>
      'Ukuhambiselwa kwehlulekile. Kuzazama futhi ngokuzenzakalela.';

  @override
  String get errorGeneric =>
      'Kukhona okwenzekile okungazelelwanga. Zama futhi.';

  @override
  String get errorNetwork =>
      'Awulakho u-intanethi. Hlola inethiwekhi yakho bese uzama futhi.';

  @override
  String get errorCameraPermission =>
      'Imvume yekhamera iyadingeka ukuhlola izitshalo. Yivula ku-Settings.';

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
  String get buttonRetry => 'Zama Futhi';

  @override
  String get buttonOpenSettings => 'Open Settings';

  @override
  String get buttonCancel => 'Khansela';

  @override
  String get buttonConfirm => 'Qinisekisa';

  @override
  String get buttonSave => 'Gcina';

  @override
  String get buttonDelete => 'Susa';

  @override
  String get buttonShare => 'Yabelana';

  @override
  String get buttonExport => 'Export';

  @override
  String get loadingDefault => 'Iyalayisha...';

  @override
  String get emptyDiagnosesTitle => 'Akukho ukuhlolwa okwenziwe';

  @override
  String get emptyDiagnosesDescription =>
      'Hlola isitshalo ukuthola ukuhlolwa kwakho kokuqala kwe-AI.';

  @override
  String get emptyDiagnosesAction => 'Hlola Isitshalo';

  @override
  String get emptyFarmsTitle => 'Awekho amapulazi aengezwe';

  @override
  String get emptyFarmsDescription =>
      'Engeza ipulazi lakho lokuqala ukuqala ukulawula izitshalo zakho.';

  @override
  String get emptyFarmsAction => 'Engeza Ipulazi';

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
