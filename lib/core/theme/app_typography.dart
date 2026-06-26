import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// AgriLink Edge — Typography System
///
/// Single source of truth for all text styles.
/// Never specify font sizes or weights directly in widgets.
///
/// Font: Inter via Google Fonts (offline-bundled).
/// Hierarchy follows Material 3 naming conventions.
abstract final class AppTypography {
  static String get _fontFamily =>
      GoogleFonts.inter().fontFamily ?? 'Inter';

  // ── DISPLAY ───────────────────────────────────────────────────────────────

  /// 57px · Regular · Hero titles, splash branding.
  static TextStyle get displayLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 57,
        fontWeight: FontWeight.w400,
        height: 64 / 57,
        letterSpacing: -0.25,
      );

  /// 45px · Regular · Large analytics numbers.
  static TextStyle get displayMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 45,
        fontWeight: FontWeight.w400,
        height: 52 / 45,
        letterSpacing: 0,
      );

  /// 36px · Regular · Prominent metric values.
  static TextStyle get displaySmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 44 / 36,
        letterSpacing: 0,
      );

  // ── HEADLINE ──────────────────────────────────────────────────────────────

  /// 32px · SemiBold · Main page titles.
  static TextStyle get headlineLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 40 / 32,
        letterSpacing: 0,
      );

  /// 28px · SemiBold · Section headers, modal titles.
  static TextStyle get headlineMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 36 / 28,
        letterSpacing: 0,
      );

  /// 24px · SemiBold · Dialog titles, sub-section headings.
  static TextStyle get headlineSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 32 / 24,
        letterSpacing: 0,
      );

  // ── TITLE ─────────────────────────────────────────────────────────────────

  /// 22px · SemiBold · App bar titles, prominent card headings.
  static TextStyle get titleLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 28 / 22,
        letterSpacing: 0,
      );

  /// 16px · SemiBold · List item titles, modal sub-headers.
  static TextStyle get titleMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 24 / 16,
        letterSpacing: 0.15,
      );

  /// 14px · SemiBold · Chip labels, badge text.
  static TextStyle get titleSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  // ── BODY ──────────────────────────────────────────────────────────────────

  /// 16px · Regular · Primary reading content, descriptions.
  static TextStyle get bodyLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        letterSpacing: 0.5,
      );

  /// 14px · Regular · Secondary content, card descriptions.
  static TextStyle get bodyMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        letterSpacing: 0.25,
      );

  /// 12px · Regular · Captions, helper text, timestamps.
  static TextStyle get bodySmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        letterSpacing: 0.4,
      );

  // ── LABEL ─────────────────────────────────────────────────────────────────

  /// 14px · Medium · Button text, tab labels.
  static TextStyle get labelLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  /// 12px · Medium · Navigation labels, secondary form labels.
  static TextStyle get labelMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.5,
      );

  /// 11px · Medium · Status badges, micro-chips, version text.
  static TextStyle get labelSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 16 / 11,
        letterSpacing: 0.5,
      );

  // ── SEMANTIC MODIFIERS ────────────────────────────────────────────────────

  /// Returns a bold (700) variant of any style.
  static TextStyle bold(TextStyle style) =>
      style.copyWith(fontWeight: FontWeight.w700);

  /// Returns a colored variant of any style.
  static TextStyle colored(TextStyle style, Color color) =>
      style.copyWith(color: color);

  /// Returns a line-through decorated style.
  static TextStyle strikethrough(TextStyle style) =>
      style.copyWith(decoration: TextDecoration.lineThrough);
}
