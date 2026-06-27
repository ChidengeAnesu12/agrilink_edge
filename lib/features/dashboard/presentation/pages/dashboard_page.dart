import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// SCREEN 009 — Dashboard (Placeholder)
/// Full implementation delivered in Phase 3 — Dashboard.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AgriLink Edge')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingMobile),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: AppSpacing.iconSizeXLarge,
                height: AppSpacing.iconSizeXLarge,
                decoration: const BoxDecoration(
                  color: AppColors.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.primary,
                  size: AppSpacing.iconSizeLarge,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Authentication Complete',
                style: AppTypography.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Dashboard arrives in Phase 3.',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
