import 'package:flutter/material.dart';

/// AgriLink Edge — Animation System
///
/// All durations and curves defined here.
/// Motion communicates state. Never animate purely for decoration.
abstract final class AppAnimation {
  // ── DURATIONS ─────────────────────────────────────────────────────────────

  static const Duration instant = Duration(milliseconds: 50);
  static const Duration veryFast = Duration(milliseconds: 100);

  /// Navigation transitions must complete within this duration.
  static const Duration fast = Duration(milliseconds: 150);

  static const Duration moderate = Duration(milliseconds: 200);
  static const Duration standard = Duration(milliseconds: 300);
  static const Duration emphasized = Duration(milliseconds: 400);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 700);
  static const Duration extended = Duration(milliseconds: 1000);
  static const Duration splash = Duration(milliseconds: 2000);

  // ── CURVES ────────────────────────────────────────────────────────────────

  static const Curve standardCurve = Curves.easeInOut;
  static const Curve enterCurve = Curves.easeOut;
  static const Curve exitCurve = Curves.easeIn;
  static const Curve springCurve = Curves.elasticOut;
  static const Curve linearCurve = Curves.linear;
  static const Curve pageCurve = Curves.fastOutSlowIn;
  static const Curve arriveCurve = Curves.decelerate;

  // ── STAGGER ───────────────────────────────────────────────────────────────

  static const Duration listItemStagger = Duration(milliseconds: 40);
  static const Duration cardStagger = Duration(milliseconds: 60);
  static const Duration onboardingStagger = Duration(milliseconds: 80);

  // ── PULSE INTERVALS (looping animations) ──────────────────────────────────

  static const Duration aiScanPulse = Duration(milliseconds: 1200);
  static const Duration voiceWaveform = Duration(milliseconds: 800);
  static const Duration syncPulse = Duration(milliseconds: 1500);
  static const Duration shimmer = Duration(milliseconds: 1000);
}
