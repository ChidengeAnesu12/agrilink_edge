import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// SCREEN 001 — Splash Screen (Foundation Placeholder)
///
/// Purpose:
/// Displays AgriLink Edge branding while the app initializes.
///
/// Full implementation (Rust kernel init, auth check, navigation)
/// will be completed in the Authentication phase.
///
/// Acceptance criteria for this placeholder:
/// - [x] Displays logo and branding
/// - [x] Uses design tokens exclusively
/// - [x] No business logic
/// - [x] No hardcoded colors or sizes
/// - [ ] Rust bridge initialization — Authentication phase
/// - [ ] Navigation to Onboarding or Dashboard — Authentication phase
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: _SplashBody(),
        ),
      ),
    );
  }
}

class _SplashBody extends StatelessWidget {
  const _SplashBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPaddingMobile,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo container
          Container(
            width: AppSpacing.iconSizeDisplay,
            height: AppSpacing.iconSizeDisplay,
            decoration: const BoxDecoration(
              color: AppColors.onPrimary,
              borderRadius: AppRadius.largeAll,
            ),
            child: const Icon(
              Icons.eco_rounded,
              size: AppSpacing.iconSizeXLarge,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // App name
          Text(
            'AgriLink Edge',
            style: AppTypography.headlineLarge.copyWith(
              color: AppColors.onPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),

          // Tagline
          Text(
            'AI-Powered Agriculture for Africa',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.primaryContainer,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xxxl),

          // Loading indicator
          const CircularProgressIndicator(
            color: AppColors.accent,
            strokeWidth: 2.0,
          ),
          const SizedBox(height: AppSpacing.md),

          // Loading label
          Text(
            'Initializing...',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
