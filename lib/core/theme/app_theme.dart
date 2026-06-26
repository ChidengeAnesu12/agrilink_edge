import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_elevation.dart';
import 'app_radius.dart';
import 'app_typography.dart';

/// AgriLink Edge — Application Theme
///
/// Assembles all design tokens into complete Material 3 ThemeData.
/// Both light and dark themes are defined here.
/// Dark mode is a dedicated palette — NOT an inversion of light mode.
abstract final class AppTheme {
  /// Full light theme.
  static ThemeData get light => _build(brightness: Brightness.light);

  /// Full dark theme.
  static ThemeData get dark => _build(brightness: Brightness.dark);

  static ThemeData _build({required Brightness brightness}) {
    final bool isLight = brightness == Brightness.light;
    final ColorScheme cs = _colorScheme(isLight: isLight);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: cs,
      scaffoldBackgroundColor:
          isLight ? AppColors.backgroundLight : AppColors.backgroundDark,
      textTheme: _textTheme(cs),
      appBarTheme: _appBar(cs, isLight),
      cardTheme: _card(cs),
      elevatedButtonTheme: _elevatedButton(cs),
      outlinedButtonTheme: _outlinedButton(cs),
      textButtonTheme: _textButton(cs),
      inputDecorationTheme: _inputDecoration(cs),
      navigationBarTheme: _navigationBar(cs),
      floatingActionButtonTheme: _fab(cs),
      chipTheme: _chip(cs),
      dialogTheme: _dialog(cs),
      bottomSheetTheme: _bottomSheet(cs),
      dividerTheme: _divider(cs),
      listTileTheme: _listTile(cs),
      snackBarTheme: _snackBar(cs),
      switchTheme: _switchTheme(cs),
      checkboxTheme: _checkboxTheme(cs),
      radioTheme: _radioTheme(cs),
      sliderTheme: _slider(cs),
      progressIndicatorTheme: _progressIndicator(cs),
      tabBarTheme: _tabBar(cs),
      tooltipTheme: _tooltip(cs),
      iconTheme: IconThemeData(color: cs.onSurface, size: 24),
      visualDensity: VisualDensity.standard,
      splashFactory: InkRipple.splashFactory,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        },
      ),
    );
  }

  // ── COLOR SCHEME ──────────────────────────────────────────────────────────

  static ColorScheme _colorScheme({required bool isLight}) {
    if (isLight) {
      return const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.accent,
        onTertiary: AppColors.onAccent,
        tertiaryContainer: AppColors.accentContainer,
        onTertiaryContainer: AppColors.onAccentContainer,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.onSurfaceLight,
        onSurfaceVariant: AppColors.onSurfaceMediumLight,
        outline: AppColors.borderLight,
        outlineVariant: AppColors.dividerLight,
        scrim: AppColors.scrim,
        inverseSurface: AppColors.onSurfaceLight,
        onInverseSurface: AppColors.surfaceLight,
        inversePrimary: AppColors.secondaryContainer,
        surfaceTint: AppColors.primary,
      );
    }

    return const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.secondary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryDark,
      onPrimaryContainer: AppColors.primaryContainer,
      secondary: AppColors.accent,
      onSecondary: AppColors.onAccent,
      secondaryContainer: Color(0xFF4A3800),
      onSecondaryContainer: AppColors.accentContainer,
      tertiary: AppColors.aiColor,
      onTertiary: AppColors.onAiColor,
      tertiaryContainer: Color(0xFF001258),
      onTertiaryContainer: AppColors.aiColorContainer,
      error: Color(0xFFFF6B6B),
      onError: Color(0xFF5F0000),
      errorContainer: Color(0xFF8B0000),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      onSurfaceVariant: AppColors.onSurfaceMediumDark,
      outline: AppColors.borderDark,
      outlineVariant: AppColors.dividerDark,
      scrim: AppColors.scrim,
      inverseSurface: AppColors.onSurfaceDark,
      onInverseSurface: AppColors.surfaceDark,
      inversePrimary: AppColors.primary,
      surfaceTint: AppColors.secondary,
    );
  }

  // ── TEXT THEME ────────────────────────────────────────────────────────────

  static TextTheme _textTheme(ColorScheme cs) => TextTheme(
        displayLarge:
            AppTypography.displayLarge.copyWith(color: cs.onSurface),
        displayMedium:
            AppTypography.displayMedium.copyWith(color: cs.onSurface),
        displaySmall:
            AppTypography.displaySmall.copyWith(color: cs.onSurface),
        headlineLarge:
            AppTypography.headlineLarge.copyWith(color: cs.onSurface),
        headlineMedium:
            AppTypography.headlineMedium.copyWith(color: cs.onSurface),
        headlineSmall:
            AppTypography.headlineSmall.copyWith(color: cs.onSurface),
        titleLarge:
            AppTypography.titleLarge.copyWith(color: cs.onSurface),
        titleMedium:
            AppTypography.titleMedium.copyWith(color: cs.onSurface),
        titleSmall:
            AppTypography.titleSmall.copyWith(color: cs.onSurface),
        bodyLarge: AppTypography.bodyLarge.copyWith(color: cs.onSurface),
        bodyMedium:
            AppTypography.bodyMedium.copyWith(color: cs.onSurfaceVariant),
        bodySmall:
            AppTypography.bodySmall.copyWith(color: cs.onSurfaceVariant),
        labelLarge:
            AppTypography.labelLarge.copyWith(color: cs.onSurface),
        labelMedium:
            AppTypography.labelMedium.copyWith(color: cs.onSurfaceVariant),
        labelSmall:
            AppTypography.labelSmall.copyWith(color: cs.onSurfaceVariant),
      );

  // ── COMPONENT THEMES ──────────────────────────────────────────────────────

  static AppBarTheme _appBar(ColorScheme cs, bool isLight) => AppBarTheme(
        elevation: AppElevation.appBar,
        scrolledUnderElevation: 1.0,
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        centerTitle: false,
        titleTextStyle:
            AppTypography.titleLarge.copyWith(color: cs.onSurface),
        iconTheme: IconThemeData(color: cs.onSurface),
        actionsIconTheme: IconThemeData(color: cs.onSurface),
        systemOverlayStyle: isLight
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
      );

  static CardThemeData _card(ColorScheme cs) => CardThemeData(
        elevation: AppElevation.card,
        color: cs.surface,
        surfaceTintColor: cs.surfaceTint,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.mediumAll,
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      );

  static ElevatedButtonThemeData _elevatedButton(ColorScheme cs) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          elevation: 0,
          minimumSize: const Size(88, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 14,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.mediumAll,
          ),
          textStyle: AppTypography.labelLarge,
        ),
      );

  static OutlinedButtonThemeData _outlinedButton(ColorScheme cs) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: cs.primary,
          side: BorderSide(color: cs.primary, width: 1.5),
          minimumSize: const Size(88, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 14,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.mediumAll,
          ),
          textStyle: AppTypography.labelLarge,
        ),
      );

  static TextButtonThemeData _textButton(ColorScheme cs) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: cs.primary,
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          textStyle: AppTypography.labelLarge,
        ),
      );

  static InputDecorationTheme _inputDecoration(ColorScheme cs) =>
      InputDecorationTheme(
        filled: true,
        fillColor: cs.surface,
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: cs.onSurfaceVariant,
        ),
        labelStyle: AppTypography.bodyMedium.copyWith(
          color: cs.onSurfaceVariant,
        ),
        floatingLabelStyle: AppTypography.labelMedium.copyWith(
          color: cs.primary,
        ),
        errorStyle: AppTypography.bodySmall.copyWith(color: cs.error),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: const OutlineInputBorder(
          borderRadius: AppRadius.mediumAll,
          borderSide: BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.mediumAll,
          borderSide: BorderSide(color: cs.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.mediumAll,
          borderSide: BorderSide(color: cs.primary, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.mediumAll,
          borderSide: BorderSide(color: cs.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.mediumAll,
          borderSide: BorderSide(color: cs.error, width: 2.0),
        ),
      );

  static NavigationBarThemeData _navigationBar(ColorScheme cs) =>
      NavigationBarThemeData(
        height: 80,
        elevation: AppElevation.bottomNav,
        backgroundColor: cs.surface,
        indicatorColor: cs.primaryContainer,
        surfaceTintColor: cs.surfaceTint,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? cs.primary
                : cs.onSurfaceVariant,
            size: 24,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? AppTypography.labelSmall.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w600,
                )
              : AppTypography.labelSmall.copyWith(
                  color: cs.onSurfaceVariant,
                );
        }),
      );

  static FloatingActionButtonThemeData _fab(ColorScheme cs) =>
      FloatingActionButtonThemeData(
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        elevation: AppElevation.fab,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.largeAll,
        ),
      );

  static ChipThemeData _chip(ColorScheme cs) => ChipThemeData(
        backgroundColor: cs.surfaceContainerHighest,
        selectedColor: cs.primaryContainer,
        labelStyle: AppTypography.labelMedium.copyWith(
          color: cs.onSurface,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.circularAll,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 0,
        side: BorderSide.none,
      );

  static DialogThemeData _dialog(ColorScheme cs) => DialogThemeData(
        backgroundColor: cs.surface,
        surfaceTintColor: cs.surfaceTint,
        elevation: AppElevation.dialog,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.extraLargeAll,
        ),
        titleTextStyle: AppTypography.headlineSmall.copyWith(
          color: cs.onSurface,
        ),
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: cs.onSurfaceVariant,
        ),
      );

  static BottomSheetThemeData _bottomSheet(ColorScheme cs) =>
      BottomSheetThemeData(
        backgroundColor: cs.surface,
        surfaceTintColor: cs.surfaceTint,
        elevation: AppElevation.bottomSheet,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.topExtraLarge,
        ),
        showDragHandle: true,
        dragHandleSize: const Size(32, 4),
      );

  static DividerThemeData _divider(ColorScheme cs) => DividerThemeData(
        color: cs.outlineVariant,
        thickness: 1.0,
        space: 1.0,
      );

  static ListTileThemeData _listTile(ColorScheme cs) => ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        titleTextStyle: AppTypography.titleMedium.copyWith(
          color: cs.onSurface,
        ),
        subtitleTextStyle: AppTypography.bodyMedium.copyWith(
          color: cs.onSurfaceVariant,
        ),
        iconColor: cs.onSurfaceVariant,
        minVerticalPadding: 12,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.mediumAll,
        ),
      );

  static SnackBarThemeData _snackBar(ColorScheme cs) => SnackBarThemeData(
        backgroundColor: cs.inverseSurface,
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: cs.onInverseSurface,
        ),
        actionTextColor: cs.inversePrimary,
        elevation: AppElevation.snackbar,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.mediumAll,
        ),
      );

  static SwitchThemeData _switchTheme(ColorScheme cs) => SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? cs.onPrimary
              : cs.outline,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? cs.primary
              : cs.surfaceContainerHighest,
        ),
      );

  static CheckboxThemeData _checkboxTheme(ColorScheme cs) =>
      CheckboxThemeData(
        checkColor: WidgetStateProperty.all(cs.onPrimary),
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? cs.primary
              : Colors.transparent,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        side: BorderSide(color: cs.outline, width: 1.5),
      );

  static RadioThemeData _radioTheme(ColorScheme cs) => RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? cs.primary
              : cs.outline,
        ),
      );

  static SliderThemeData _slider(ColorScheme cs) => SliderThemeData(
        activeTrackColor: cs.primary,
        inactiveTrackColor: cs.primaryContainer,
        thumbColor: cs.primary,
        overlayColor: cs.primary.withValues(alpha: 0.12),
        valueIndicatorColor: cs.primary,
        valueIndicatorTextStyle: AppTypography.labelMedium.copyWith(
          color: cs.onPrimary,
        ),
      );

  static ProgressIndicatorThemeData _progressIndicator(ColorScheme cs) =>
      ProgressIndicatorThemeData(
        color: cs.primary,
        linearTrackColor: cs.primaryContainer,
        circularTrackColor: cs.primaryContainer,
        linearMinHeight: 4.0,
      );

  static TabBarThemeData _tabBar(ColorScheme cs) => TabBarThemeData(
        labelColor: cs.primary,
        unselectedLabelColor: cs.onSurfaceVariant,
        labelStyle: AppTypography.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppTypography.labelLarge,
        indicatorColor: cs.primary,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: cs.outlineVariant,
      );

  static TooltipThemeData _tooltip(ColorScheme cs) => TooltipThemeData(
        decoration: BoxDecoration(
          color: cs.inverseSurface,
          borderRadius: AppRadius.smallAll,
        ),
        textStyle: AppTypography.bodySmall.copyWith(
          color: cs.onInverseSurface,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      );
}
