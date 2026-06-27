import 'package:flutter/material.dart';

import '../../../../../core/theme/app_animation.dart';
import '../../../../../core/theme/app_colors.dart';

/// Animated dot page indicator for the onboarding PageView.
class OnboardingDotIndicator extends StatelessWidget {
  const OnboardingDotIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.borderLight,
  });

  final int currentPage;
  final int totalPages;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalPages, (i) {
        final bool isActive = i == currentPage;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: AnimatedContainer(
            duration: AppAnimation.moderate,
            curve: AppAnimation.standardCurve,
            width: isActive ? 24.0 : 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: isActive ? activeColor : inactiveColor,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
          ),
        );
      }),
    );
  }
}
