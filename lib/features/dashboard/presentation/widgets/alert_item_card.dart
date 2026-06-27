import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/alert_entity.dart';

/// Single alert row card for the dashboard and alerts center.
class AlertItemCard extends StatelessWidget {
  const AlertItemCard({
    super.key,
    required this.alert,
    this.onTap,
  });

  final AlertEntity alert;
  final VoidCallback? onTap;

  Color get _color {
    switch (alert.severity) {
      case AlertSeverity.critical:
        return AppColors.error;
      case AlertSeverity.high:
        return AppColors.warning;
      case AlertSeverity.medium:
        return AppColors.info;
      case AlertSeverity.low:
        return AppColors.offlineIndicator;
    }
  }

  IconData get _icon {
    switch (alert.type) {
      case AlertType.ai:
        return Icons.psychology_rounded;
      case AlertType.weather:
        return Icons.thunderstorm_rounded;
      case AlertType.sync:
        return Icons.sync_rounded;
      case AlertType.market:
        return Icons.storefront_rounded;
      case AlertType.government:
        return Icons.account_balance_rounded;
      case AlertType.community:
        return Icons.groups_rounded;
      case AlertType.emergency:
        return Icons.emergency_rounded;
    }
  }

  String get _timeAgo {
    final diff = DateTime.now().difference(alert.timestamp);
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
          color: alert.isRead
              ? Theme.of(context).colorScheme.surface
              : _color.withValues(alpha: 0.05),
          borderRadius: AppRadius.mediumAll,
          border: Border.all(
            color: alert.isRead
                ? Theme.of(context).colorScheme.outline
                : _color.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(_icon, color: _color, size: 18),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          alert.title,
                          style: AppTypography.titleSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        _timeAgo,
                        style: AppTypography.labelSmall.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    alert.message,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (!alert.isRead) ...[
              const SizedBox(width: AppSpacing.xs),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _color,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
