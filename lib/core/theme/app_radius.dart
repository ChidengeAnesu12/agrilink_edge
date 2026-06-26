import 'package:flutter/material.dart';

/// AgriLink Edge — Border Radius System
///
/// All border radius values defined here as const objects.
/// Never hardcode border radius values directly in widgets.
abstract final class AppRadius {
  // ── SCALAR VALUES ─────────────────────────────────────────────────────────

  static const double extraSmall = 4.0;
  static const double small = 8.0;
  static const double medium = 12.0;
  static const double large = 16.0;
  static const double extraLarge = 24.0;
  static const double xxLarge = 32.0;
  static const double circular = 999.0;

  // ── CONST BORDER RADIUS OBJECTS ───────────────────────────────────────────

  /// 4dp — chips, compact tags.
  static const BorderRadius extraSmallAll = BorderRadius.all(
    Radius.circular(extraSmall),
  );

  /// 8dp — input fields, thumbnails.
  static const BorderRadius smallAll = BorderRadius.all(
    Radius.circular(small),
  );

  /// 12dp — cards, list items.
  static const BorderRadius mediumAll = BorderRadius.all(
    Radius.circular(medium),
  );

  /// 16dp — prominent cards, action sheets.
  static const BorderRadius largeAll = BorderRadius.all(
    Radius.circular(large),
  );

  /// 24dp — bottom sheets, dialogs.
  static const BorderRadius extraLargeAll = BorderRadius.all(
    Radius.circular(extraLarge),
  );

  /// 32dp — large modal containers.
  static const BorderRadius xxLargeAll = BorderRadius.all(
    Radius.circular(xxLarge),
  );

  /// Full circular — avatars, FABs, icon buttons.
  static const BorderRadius circularAll = BorderRadius.all(
    Radius.circular(circular),
  );

  /// Top corners only at 24dp — bottom sheets, drawers.
  static const BorderRadius topExtraLarge = BorderRadius.only(
    topLeft: Radius.circular(extraLarge),
    topRight: Radius.circular(extraLarge),
  );

  /// Left corners only — segmented button start segment.
  static const BorderRadius startMedium = BorderRadius.only(
    topLeft: Radius.circular(medium),
    bottomLeft: Radius.circular(medium),
  );

  /// Right corners only — segmented button end segment.
  static const BorderRadius endMedium = BorderRadius.only(
    topRight: Radius.circular(medium),
    bottomRight: Radius.circular(medium),
  );
}
