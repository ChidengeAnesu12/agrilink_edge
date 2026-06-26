/// AgriLink Edge — Spacing System (8-point grid)
///
/// All spatial measurements must reference these values.
/// Never use SizedBox(height: 13) or any arbitrary number.
abstract final class AppSpacing {
  // ── BASE ──────────────────────────────────────────────────────────────────

  static const double base = 8.0;

  // ── NAMED SCALE ───────────────────────────────────────────────────────────

  /// 2dp — micro spacing, icon-to-text distance.
  static const double xxs = 2.0;

  /// 4dp — extra small, tight internal padding.
  static const double xs = 4.0;

  /// 8dp — small, icon padding, compact list gaps.
  static const double sm = 8.0;

  /// 12dp — medium, standard internal component padding.
  static const double md = 12.0;

  /// 16dp — large, standard content padding.
  static const double lg = 16.0;

  /// 24dp — extra large, card padding, section separation.
  static const double xl = 24.0;

  /// 32dp — 2XL, page margins, major section dividers.
  static const double xxl = 32.0;

  /// 48dp — 3XL, major screen section breaks.
  static const double xxxl = 48.0;

  /// 64dp — display, splash and hero element gaps.
  static const double display = 64.0;

  // ── SEMANTIC ──────────────────────────────────────────────────────────────

  /// Standard horizontal screen margin on phones.
  static const double screenPaddingMobile = 16.0;

  /// Standard horizontal screen margin on tablets.
  static const double screenPaddingTablet = 24.0;

  /// Standard horizontal screen margin on desktop.
  static const double screenPaddingDesktop = 32.0;

  /// Vertical padding inside cards.
  static const double cardPaddingVertical = 16.0;

  /// Horizontal padding inside cards.
  static const double cardPaddingHorizontal = 16.0;

  /// Vertical gap between cards in a list.
  static const double cardGap = 12.0;

  /// Vertical gap between items within a section.
  static const double itemGap = 8.0;

  /// Minimum touch target — always >= 48dp per accessibility rules.
  static const double touchTarget = 48.0;

  static const double iconSizeStandard = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 48.0;
  static const double iconSizeDisplay = 64.0;

  static const double bottomNavHeight = 80.0;
  static const double appBarHeight = 56.0;
}
