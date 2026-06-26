import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// AgriLink Edge — Localization Configuration
///
/// Supported languages:
/// - English (en) — primary language
/// - Shona (sn) — Zimbabwe's most widely spoken language
/// - Ndebele (nd) — Zimbabwe's second national language
///
/// All user-facing strings live in lib/l10n/ ARB files.
/// After editing ARBs, run: flutter gen-l10n
/// The generated S class will appear in lib/generated/l10n/.
abstract final class AppLocalizations {
  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('sn'),
    Locale('nd'),
  ];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    // S.delegate, // Uncomment after running: flutter gen-l10n
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
