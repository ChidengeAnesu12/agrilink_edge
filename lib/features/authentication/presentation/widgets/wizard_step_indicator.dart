import 'package:flutter/material.dart';

import '../../../../core/theme/app_animation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Numbered step progress indicator for the Farm Setup Wizard.
class WizardStepIndicator extends StatelessWidget {
  const WizardStepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.stepLabels,
  });

  final int currentStep;
  final int totalSteps;
  final List<String> stepLabels;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(totalSteps * 2 - 1, (i) {
            if (i.isOdd) {
              final bool done = i ~/ 2 < currentStep;
              return Expanded(
                child: AnimatedContainer(
                  duration: AppAnimation.moderate,
                  height: 2,
                  color: done ? AppColors.primary : AppColors.borderLight,
                ),
              );
            }
            final int step = i ~/ 2;
            final bool done = step < currentStep;
            final bool active = step == currentStep;
            return AnimatedContainer(
              duration: AppAnimation.moderate,
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: done
                    ? AppColors.primary
                    : active
                        ? AppColors.primaryContainer
                        : AppColors.backgroundLight,
                border: Border.all(
                  color: done || active
                      ? AppColors.primary
                      : AppColors.borderLight,
                  width: active ? 2.0 : 1.0,
                ),
              ),
              child: Center(
                child: done
                    ? const Icon(
                        Icons.check_rounded,
                        size: 16,
                        color: AppColors.onPrimary,
                      )
                    : Text(
                        '${step + 1}',
                        style: AppTypography.labelMedium.copyWith(
                          color: active
                              ? AppColors.primary
                              : AppColors.onSurfaceLowLight,
                          fontWeight: active
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
              ),
            );
          }),
        ),
        const SizedBox(height: AppSpacing.xs),
        if (currentStep < stepLabels.length)
          Text(
            stepLabels[currentStep],
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.primary,
            ),
          ),
      ],
    );
  }
}
