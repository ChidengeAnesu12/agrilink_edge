import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_theme.dart';
import '../../routes/app_router.dart';

/// Bootstraps the AgriLink Edge application.
///
/// Responsibilities:
/// - Catching and logging unhandled errors
/// - Ensuring Flutter bindings are initialized
/// - Disabling runtime font fetching (offline-first)
/// - Setting portrait orientation lock
/// - Enabling edge-to-edge rendering
/// - Running the root application widget inside [ProviderScope]
Future<void> bootstrap() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // TODO: Replace with structured logger in production
  };

  await runZonedGuarded(_run, (error, stackTrace) {
    debugPrint('[AgriLinkEdge] Uncaught error: $error\n$stackTrace');
    // TODO: Replace with structured logger in production
  });
}

Future<void> _run() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Disable runtime font fetching — mandatory for offline-first operation.
  // Inter is bundled inside the google_fonts package assets.
  GoogleFonts.config.allowRuntimeFetching = false;

  // Lock to portrait. Individual screens unlock landscape where required.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Enable edge-to-edge rendering for immersive UI.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    const ProviderScope(
      child: AgriLinkEdgeApp(),
    ),
  );
}

/// Root application widget for AgriLink Edge.
///
/// Configures:
/// - Material 3 theming (light and dark)
/// - GoRouter navigation
/// - Localization (English, Shona, Ndebele)
/// - Text scale clamping for layout protection
class AgriLinkEdgeApp extends ConsumerWidget {
  const AgriLinkEdgeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'AgriLink Edge',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: router,
      localizationsDelegates: const [
        // S.delegate — uncomment after running: flutter gen-l10n
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('sn'),
        Locale('nd'),
      ],
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: TextScaler.linear(
              mediaQuery.textScaler.scale(1.0).clamp(0.8, 1.3),
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
