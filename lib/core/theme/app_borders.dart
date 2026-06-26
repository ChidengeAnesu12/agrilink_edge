import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radius.dart';

/// AgriLink Edge — Border System
///
/// All borders defined here. Never create inline border definitions.
abstract final class AppBorders {
  // ── STANDARD ──────────────────────────────────────────────────────────────

  static Border get standard => Border.all(
        color: AppColors.borderLight,
      );

  static Border get subtle => Border.all(
        color: AppColors.dividerLight,
      );

  // ── SEMANTIC ──────────────────────────────────────────────────────────────

  static Border get primary => Border.all(
        color: AppColors.primary,
        width: 1.5,
      );

  static Border get error => Border.all(
        color: AppColors.error,
        width: 1.5,
      );

  static Border get warning => Border.all(
        color: AppColors.warning,
        width: 1.5,
      );

  static Border get ai => Border.all(
        color: AppColors.aiColor,
        width: 1.5,
      );

  // ── INPUT BORDERS ─────────────────────────────────────────────────────────

  static const OutlineInputBorder inputDefault = OutlineInputBorder(
    borderRadius: AppRadius.mediumAll,
    borderSide: BorderSide(color: AppColors.borderLight),
  );

  static const OutlineInputBorder inputFocused = OutlineInputBorder(
    borderRadius: AppRadius.mediumAll,
    borderSide: BorderSide(color: AppColors.primary, width: 2.0),
  );

  static const OutlineInputBorder inputError = OutlineInputBorder(
    borderRadius: AppRadius.mediumAll,
    borderSide: BorderSide(color: AppColors.error, width: 1.5),
  );

  static const OutlineInputBorder inputDisabled = OutlineInputBorder(
    borderRadius: AppRadius.mediumAll,
    borderSide: BorderSide(color: AppColors.borderLight),
  );

  // ── DIRECTIONAL ───────────────────────────────────────────────────────────

  static const Border bottomOnly = Border(
    bottom: BorderSide(color: AppColors.borderLight),
  );

  static const Border topOnly = Border(
    top: BorderSide(color: AppColors.borderLight),
  );
}
