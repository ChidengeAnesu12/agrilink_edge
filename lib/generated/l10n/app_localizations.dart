import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_nd.dart';
import 'app_localizations_sn.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('nd'),
    Locale('sn')
  ];

  /// Application name.
  ///
  /// In en, this message translates to:
  /// **'AgriLink Edge'**
  String get appName;

  /// Tagline on splash and onboarding.
  ///
  /// In en, this message translates to:
  /// **'AI-Powered Agriculture for Africa'**
  String get appTagline;

  /// No description provided for @splashInitializing.
  ///
  /// In en, this message translates to:
  /// **'Initializing...'**
  String get splashInitializing;

  /// No description provided for @splashLoadingAi.
  ///
  /// In en, this message translates to:
  /// **'Loading AI models...'**
  String get splashLoadingAi;

  /// No description provided for @splashLoadingDatabase.
  ///
  /// In en, this message translates to:
  /// **'Preparing database...'**
  String get splashLoadingDatabase;

  /// No description provided for @splashReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get splashReady;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to AgriLink Edge'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Description.
  ///
  /// In en, this message translates to:
  /// **'The most advanced offline-first agricultural intelligence platform in Africa.'**
  String get onboarding1Description;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'Works Without Internet'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Description.
  ///
  /// In en, this message translates to:
  /// **'AI diagnosis, farm management, and weather forecasts — all available offline.'**
  String get onboarding2Description;

  /// No description provided for @onboarding3Title.
  ///
  /// In en, this message translates to:
  /// **'Diagnose Crop Diseases'**
  String get onboarding3Title;

  /// No description provided for @onboarding3Description.
  ///
  /// In en, this message translates to:
  /// **'Point your camera at any crop. Our AI identifies diseases in seconds.'**
  String get onboarding3Description;

  /// No description provided for @onboarding4Title.
  ///
  /// In en, this message translates to:
  /// **'Farmer-to-Farmer Network'**
  String get onboarding4Title;

  /// No description provided for @onboarding4Description.
  ///
  /// In en, this message translates to:
  /// **'Connect with nearby farmers even without internet using mesh networking.'**
  String get onboarding4Description;

  /// No description provided for @onboarding5Title.
  ///
  /// In en, this message translates to:
  /// **'Live Weather Intelligence'**
  String get onboarding5Title;

  /// No description provided for @onboarding5Description.
  ///
  /// In en, this message translates to:
  /// **'Hyperlocal weather forecasts and spray advisories tailored to your farm.'**
  String get onboarding5Description;

  /// No description provided for @onboarding6Title.
  ///
  /// In en, this message translates to:
  /// **'Find Markets and Buyers'**
  String get onboarding6Title;

  /// No description provided for @onboarding6Description.
  ///
  /// In en, this message translates to:
  /// **'Get real-time prices, nearby buyers, and sell your produce directly.'**
  String get onboarding6Description;

  /// No description provided for @onboarding7Title.
  ///
  /// In en, this message translates to:
  /// **'Government Collaboration'**
  String get onboarding7Title;

  /// No description provided for @onboarding7Description.
  ///
  /// In en, this message translates to:
  /// **'Connect with AGRITEX extension officers and access government support.'**
  String get onboarding7Description;

  /// No description provided for @onboarding8Title.
  ///
  /// In en, this message translates to:
  /// **'Allow Permissions'**
  String get onboarding8Title;

  /// No description provided for @onboarding8Description.
  ///
  /// In en, this message translates to:
  /// **'AgriLink Edge needs camera, location, and storage to give you the best experience.'**
  String get onboarding8Description;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginTitle;

  /// No description provided for @loginPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get loginPhoneLabel;

  /// No description provided for @loginEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get loginEmailLabel;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginButton;

  /// No description provided for @loginBiometricButton.
  ///
  /// In en, this message translates to:
  /// **'Use Biometrics'**
  String get loginBiometricButton;

  /// No description provided for @loginGuestButton.
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get loginGuestButton;

  /// No description provided for @loginRegisterPrompt.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginRegisterPrompt;

  /// No description provided for @loginRegisterLink.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get loginRegisterLink;

  /// No description provided for @dashboardGreetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name}'**
  String dashboardGreetingMorning(String name);

  /// No description provided for @dashboardGreetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon, {name}'**
  String dashboardGreetingAfternoon(String name);

  /// No description provided for @dashboardGreetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening, {name}'**
  String dashboardGreetingEvening(String name);

  /// No description provided for @dashboardFarmHealth.
  ///
  /// In en, this message translates to:
  /// **'Farm Health'**
  String get dashboardFarmHealth;

  /// No description provided for @dashboardQuickScan.
  ///
  /// In en, this message translates to:
  /// **'Scan Crop'**
  String get dashboardQuickScan;

  /// No description provided for @dashboardWeather.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get dashboardWeather;

  /// No description provided for @dashboardMarketPrices.
  ///
  /// In en, this message translates to:
  /// **'Market Prices'**
  String get dashboardMarketPrices;

  /// No description provided for @offlineBadge.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offlineBadge;

  /// No description provided for @offlineMessage.
  ///
  /// In en, this message translates to:
  /// **'You are offline. Data is saved locally and will sync when connected.'**
  String get offlineMessage;

  /// No description provided for @syncPending.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get syncPending;

  /// No description provided for @syncComplete.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get syncComplete;

  /// No description provided for @syncFailed.
  ///
  /// In en, this message translates to:
  /// **'Sync failed. Will retry automatically.'**
  String get syncFailed;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something unexpected happened. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Check your network and try again.'**
  String get errorNetwork;

  /// No description provided for @errorCameraPermission.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to scan crops. Enable it in Settings.'**
  String get errorCameraPermission;

  /// No description provided for @errorLocationPermission.
  ///
  /// In en, this message translates to:
  /// **'Location permission is required for map features. Enable it in Settings.'**
  String get errorLocationPermission;

  /// No description provided for @errorAiInference.
  ///
  /// In en, this message translates to:
  /// **'AI analysis could not be completed. Ensure the crop is well-lit and try again.'**
  String get errorAiInference;

  /// No description provided for @errorStorageFull.
  ///
  /// In en, this message translates to:
  /// **'Device storage is full. Free up space and try again.'**
  String get errorStorageFull;

  /// No description provided for @buttonRetry.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get buttonRetry;

  /// No description provided for @buttonOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get buttonOpenSettings;

  /// No description provided for @buttonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get buttonCancel;

  /// No description provided for @buttonConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get buttonConfirm;

  /// No description provided for @buttonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get buttonSave;

  /// No description provided for @buttonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get buttonDelete;

  /// No description provided for @buttonShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get buttonShare;

  /// No description provided for @buttonExport.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get buttonExport;

  /// No description provided for @loadingDefault.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loadingDefault;

  /// No description provided for @emptyDiagnosesTitle.
  ///
  /// In en, this message translates to:
  /// **'No diagnoses yet'**
  String get emptyDiagnosesTitle;

  /// No description provided for @emptyDiagnosesDescription.
  ///
  /// In en, this message translates to:
  /// **'Scan a crop to get your first AI diagnosis.'**
  String get emptyDiagnosesDescription;

  /// No description provided for @emptyDiagnosesAction.
  ///
  /// In en, this message translates to:
  /// **'Scan Crop'**
  String get emptyDiagnosesAction;

  /// No description provided for @emptyFarmsTitle.
  ///
  /// In en, this message translates to:
  /// **'No farms added'**
  String get emptyFarmsTitle;

  /// No description provided for @emptyFarmsDescription.
  ///
  /// In en, this message translates to:
  /// **'Add your first farm to start managing your crops.'**
  String get emptyFarmsDescription;

  /// No description provided for @emptyFarmsAction.
  ///
  /// In en, this message translates to:
  /// **'Add Farm'**
  String get emptyFarmsAction;

  /// No description provided for @emptyNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get emptyNotificationsTitle;

  /// No description provided for @emptyNotificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'You are up to date. Check back later.'**
  String get emptyNotificationsDescription;

  /// No description provided for @emptyPostsTitle.
  ///
  /// In en, this message translates to:
  /// **'No posts yet'**
  String get emptyPostsTitle;

  /// No description provided for @emptyPostsDescription.
  ///
  /// In en, this message translates to:
  /// **'Be the first to share something with your community.'**
  String get emptyPostsDescription;

  /// No description provided for @emptyPostsAction.
  ///
  /// In en, this message translates to:
  /// **'Create Post'**
  String get emptyPostsAction;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'nd', 'sn'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
    case 'nd':
      return SNd();
    case 'sn':
      return SSn();
  }

  throw FlutterError(
      'S.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
