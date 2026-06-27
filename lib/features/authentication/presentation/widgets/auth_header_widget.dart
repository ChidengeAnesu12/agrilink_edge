import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';

/// Branded header used on all authentication screens.
class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconData = Icons.eco_rounded,
    this.iconColor = AppColors.primary,
    this.iconBackgroundColor = AppColors.primaryContainer,
  });

  final String title;
  final String subtitle;
  final IconData iconData;
  final Color iconColor;
  final Color iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppSpacing.iconSizeXLarge,
          height: AppSpacing.iconSizeXLarge,
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Icon(
            iconData,
            color: iconColor,
            size: AppSpacing.iconSizeLarge,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.xs),
        Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
