/// AgriLink Edge — Elevation System
///
/// Material 3 elevation levels. Never use arbitrary values.
abstract final class AppElevation {
  static const double level0 = 0.0;
  static const double level1 = 1.0;
  static const double level2 = 2.0;
  static const double level3 = 3.0;
  static const double level4 = 4.0;
  static const double level6 = 6.0;
  static const double level8 = 8.0;
  static const double level12 = 12.0;

  // ── SEMANTIC ALIASES ──────────────────────────────────────────────────────

  static const double card = level1;
  static const double cardHighlighted = level2;
  static const double appBar = level0;
  static const double bottomNav = level2;
  static const double fab = level6;
  static const double dialog = level12;
  static const double bottomSheet = level8;
  static const double drawer = level8;
  static const double snackbar = level6;
  static const double menu = level8;
}
