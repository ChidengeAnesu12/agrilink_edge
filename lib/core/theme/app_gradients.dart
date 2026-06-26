import 'package:flutter/material.dart';
import 'app_colors.dart';

/// AgriLink Edge — Gradient System
///
/// All gradients defined here. Never create inline gradients in widgets.
/// Gradients are used sparingly: headers, feature backgrounds, overlays only.
abstract final class AppGradients {
  // ── BRAND ─────────────────────────────────────────────────────────────────

  static const LinearGradient primaryVertical = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primaryDark, AppColors.primary, AppColors.secondary],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient primaryDiagonal = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primaryDark, AppColors.secondary],
  );

  // ── FEATURE ───────────────────────────────────────────────────────────────

  static const LinearGradient ai = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A237E), AppColors.aiColor],
  );

  static const LinearGradient gis = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF004D40), AppColors.gisColor],
  );

  static const LinearGradient marketplace = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE65100), AppColors.marketplaceColor],
  );

  // ── OVERLAYS ──────────────────────────────────────────────────────────────

  /// Ensures text readability over images.
  static const LinearGradient imageBottomOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x00000000), Color(0xCC000000)],
    stops: [0.4, 1.0],
  );

  /// For map UI elements floating over map tiles.
  static const LinearGradient mapTopOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x99000000), Color(0x00000000)],
    stops: [0.0, 0.6],
  );

  // ── WEATHER ───────────────────────────────────────────────────────────────

  static const LinearGradient clearSky = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
  );

  static const LinearGradient overcast = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF37474F), Color(0xFF78909C)],
  );
}
