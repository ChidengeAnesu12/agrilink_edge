import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Compact recent diagnosis list item.
class RecentDiagnosisCard extends StatelessWidget {
  const RecentDiagnosisCard({
    super.key,
    required this.cropName,
    required this.diseaseName,
    required this.confidence,
    required this.severity,
    required this.timestamp,
    this.onTap,
  });

  final String cropName;
  final String diseaseName;
  final double confidence;
  final String severity;
  final DateTime timestamp;
  final VoidCallback? onTap;

  Color get _severityColor {
    switch (severity.toLowerCase()) {
      case 'critical':
        return AppColors.error;
      case 'high':
        return AppColors.warning;
      case 'medium':
        return AppColors.info;
      default:
        return AppColors.success;
    }
  }

  String get _timeAgo {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: AppRadius.mediumAll,
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.aiColorContainer,
                borderRadius: AppRadius.smallAll,
              ),
              child: const Icon(
                Icons.biotech_rounded,
                color: AppColors.aiColor,
                size: 24,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diseaseName,
                    style: AppTypography.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    '$cropName · $_timeAgo',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs,
                    vertical: AppSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: _severityColor.withValues(alpha: 0.1),
                    borderRadius: AppRadius.extraSmallAll,
                  ),
                  child: Text(
                    severity,
                    style: AppTypography.labelSmall.copyWith(
                      color: _severityColor,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  '${confidence.round()}%',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.aiColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
