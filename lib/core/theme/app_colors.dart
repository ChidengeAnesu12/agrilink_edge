import 'package:flutter/material.dart';

/// AgriLink Edge — Color System
///
/// Single source of truth for every color in the application.
/// Never hardcode a color value anywhere else in the codebase.
///
/// Feature color rules:
/// - [aiColor] is EXCLUSIVELY for AI-powered features.
/// - [gisColor] is EXCLUSIVELY for GIS and map features.
/// - [marketplaceColor] is EXCLUSIVELY for marketplace features.
abstract final class AppColors {
  // ── PRIMARY BRAND ─────────────────────────────────────────────────────────

  /// Forest Green — primary brand identity.
  static const Color primary = Color(0xFF2E7D32);
  static const Color primaryContainer = Color(0xFFE8F5E9);
  static const Color primaryDark = Color(0xFF1B5E20);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFF003910);

  // ── SECONDARY BRAND ───────────────────────────────────────────────────────

  /// Nature Green — secondary brand color.
  static const Color secondary = Color(0xFF43A047);
  static const Color secondaryContainer = Color(0xFFC8E6C9);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFF002204);

  // ── ACCENT ────────────────────────────────────────────────────────────────

  /// Harvest Gold — used sparingly for highlights and key calls-to-action.
  static const Color accent = Color(0xFFF9A825);
  static const Color accentContainer = Color(0xFFFFF8E1);
  static const Color onAccent = Color(0xFF1C1C1E);
  static const Color onAccentContainer = Color(0xFF4A3800);

  // ── SEMANTIC: SUCCESS ─────────────────────────────────────────────────────

  static const Color success = Color(0xFF2E7D32);
  static const Color successContainer = Color(0xFFE8F5E9);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color onSuccessContainer = Color(0xFF003910);

  // ── SEMANTIC: WARNING ─────────────────────────────────────────────────────

  static const Color warning = Color(0xFFEF6C00);
  static const Color warningContainer = Color(0xFFFFF3E0);
  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color onWarningContainer = Color(0xFF4A2000);

  // ── SEMANTIC: ERROR ───────────────────────────────────────────────────────

  static const Color error = Color(0xFFD32F2F);
  static const Color errorContainer = Color(0xFFFFEBEE);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF5F0000);

  // ── SEMANTIC: INFO ────────────────────────────────────────────────────────

  static const Color info = Color(0xFF1976D2);
  static const Color infoContainer = Color(0xFFE3F2FD);
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color onInfoContainer = Color(0xFF003058);

  // ── FEATURE: AI ───────────────────────────────────────────────────────────

  /// Electric Blue — EXCLUSIVELY for AI features. Never reuse elsewhere.
  static const Color aiColor = Color(0xFF2962FF);
  static const Color aiColorContainer = Color(0xFFE8EAFF);
  static const Color onAiColor = Color(0xFFFFFFFF);
  static const Color onAiColorContainer = Color(0xFF001258);

  // ── FEATURE: GIS / MAPS ───────────────────────────────────────────────────

  /// Deep Cyan — EXCLUSIVELY for GIS and map features.
  static const Color gisColor = Color(0xFF00838F);
  static const Color gisColorContainer = Color(0xFFE0F7FA);
  static const Color onGisColor = Color(0xFFFFFFFF);
  static const Color onGisColorContainer = Color(0xFF002B2F);

  // ── FEATURE: MARKETPLACE ──────────────────────────────────────────────────

  /// Orange — for marketplace feature indicators and CTAs.
  static const Color marketplaceColor = Color(0xFFFB8C00);
  static const Color marketplaceContainer = Color(0xFFFFF3E0);
  static const Color onMarketplaceColor = Color(0xFFFFFFFF);
  static const Color onMarketplaceContainer = Color(0xFF4A2500);

  // ── SYNC & OFFLINE STATUS ─────────────────────────────────────────────────

  /// Slate Gray — device is operating in offline mode.
  static const Color offlineIndicator = Color(0xFF607D8B);
  static const Color offlineContainer = Color(0xFFECEFF1);

  /// Amber — synchronization is pending or in progress.
  static const Color syncPending = Color(0xFFFFC107);

  /// Green — synchronization completed successfully.
  static const Color syncComplete = Color(0xFF43A047);

  /// Red — synchronization has failed.
  static const Color syncFailed = Color(0xFFD32F2F);

  // ── LIGHT MODE ────────────────────────────────────────────────────────────

  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color dividerLight = Color(0xFFEEEEEE);
  static const Color onSurfaceLight = Color(0xFF1C1C1E);
  static const Color onSurfaceMediumLight = Color(0xFF5C5C5C);
  static const Color onSurfaceLowLight = Color(0xFF9E9E9E);

  // ── DARK MODE — dedicated palette, not inverted light mode ───────────────

  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color cardDark = Color(0xFF242424);
  static const Color borderDark = Color(0xFF2C2C2C);
  static const Color dividerDark = Color(0xFF2C2C2C);
  static const Color onSurfaceDark = Color(0xFFE8E8E8);
  static const Color onSurfaceMediumDark = Color(0xFFAAAAAA);
  static const Color onSurfaceLowDark = Color(0xFF6B6B6B);

  // ── UTILITY ───────────────────────────────────────────────────────────────

  static const Color transparent = Color(0x00000000);
  static const Color scrim = Color(0x8A000000);
  static const Color elevationOverlay = Color(0x0FFFFFFF);
}
