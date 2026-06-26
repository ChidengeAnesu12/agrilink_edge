import 'package:flutter/material.dart';

/// AgriLink Edge — Responsive Breakpoint System
///
/// Screen size detection for adaptive layouts.
/// Never hardcode pixel values for layout decisions.
abstract final class AppBreakpoints {
  // ── THRESHOLDS (dp) ───────────────────────────────────────────────────────

  static const double compact = 600.0;
  static const double medium = 840.0;
  static const double expanded = 1024.0;

  // ── DETECTION ─────────────────────────────────────────────────────────────

  static bool isCompact(BuildContext context) =>
      MediaQuery.sizeOf(context).width < compact;

  static bool isMedium(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= compact && width < medium;
  }

  static bool isExpanded(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= medium;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= compact;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= expanded;

  // ── ADAPTIVE VALUES ───────────────────────────────────────────────────────

  static double horizontalMargin(BuildContext context) {
    if (isDesktop(context)) return 32.0;
    if (isTablet(context)) return 24.0;
    return 16.0;
  }

  static int gridColumns(BuildContext context) {
    if (isDesktop(context)) return 12;
    if (isExpanded(context)) return 8;
    if (isMedium(context)) return 6;
    return 4;
  }

  static int cardColumns(BuildContext context) {
    if (isDesktop(context)) return 4;
    if (isExpanded(context)) return 3;
    return 2;
  }

  static double maxContentWidth(BuildContext context) {
    if (isDesktop(context)) return 1200.0;
    if (isExpanded(context)) return 900.0;
    return double.infinity;
  }
}
