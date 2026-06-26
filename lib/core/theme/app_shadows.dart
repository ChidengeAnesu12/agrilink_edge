import 'package:flutter/material.dart';

/// AgriLink Edge — Shadow System
///
/// All box shadows defined here. Never create custom shadows inline.
abstract final class AppShadows {
  // ── STANDARD ──────────────────────────────────────────────────────────────

  static const List<BoxShadow> small = [
    BoxShadow(
      color: Color(0x14000000), // 8% black
      offset: Offset(0, 1),
      blurRadius: 4,
    ),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color(0x1F000000), // 12% black
      offset: Offset(0, 2),
      blurRadius: 8,
    ),
  ];

  static const List<BoxShadow> large = [
    BoxShadow(
      color: Color(0x29000000), // 16% black
      offset: Offset(0, 4),
      blurRadius: 16,
    ),
  ];

  static const List<BoxShadow> floating = [
    BoxShadow(
      color: Color(0x33000000), // 20% black
      offset: Offset(0, 6),
      blurRadius: 24,
    ),
  ];

  static const List<BoxShadow> dialog = [
    BoxShadow(
      color: Color(0x3D000000), // 24% black
      offset: Offset(0, 8),
      blurRadius: 40,
    ),
  ];

  // ── COLORED ───────────────────────────────────────────────────────────────

  /// Primary green glow — active scan button, primary CTAs.
  static const List<BoxShadow> primaryGlow = [
    BoxShadow(
      color: Color(0x3D2E7D32), // 24% primary green
      offset: Offset(0, 4),
      blurRadius: 16,
    ),
  ];

  /// Electric blue glow — AI feature emphasis.
  static const List<BoxShadow> aiGlow = [
    BoxShadow(
      color: Color(0x3D2962FF), // 24% AI blue
      offset: Offset(0, 4),
      blurRadius: 16,
    ),
  ];
}
