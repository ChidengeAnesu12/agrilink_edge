import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/weather_summary_entity.dart';

/// Compact weather summary card for the dashboard.
class WeatherSummaryCard extends StatelessWidget {
  const WeatherSummaryCard({
    super.key,
    required this.entity,
    this.onTap,
  });

  final WeatherSummaryEntity entity;
  final VoidCallback? onTap;

  IconData get _icon {
    switch (entity.condition) {
      case WeatherCondition.sunny:
        return Icons.wb_sunny_rounded;
      case WeatherCondition.partlyCloudy:
        return Icons.wb_cloudy_rounded;
      case WeatherCondition.cloudy:
        return Icons.cloud_rounded;
      case WeatherCondition.rainy:
        return Icons.water_rounded;
      case WeatherCondition.stormy:
        return Icons.thunderstorm_rounded;
      case WeatherCondition.drizzle:
        return Icons.water_drop_rounded;
      case WeatherCondition.windy:
        return Icons.air_rounded;
    }
  }

  Color get _iconColor {
    switch (entity.condition) {
      case WeatherCondition.sunny:
        return AppColors.accent;
      case WeatherCondition.partlyCloudy:
      case WeatherCondition.cloudy:
        return const Color(0xFF42A5F5);
      case WeatherCondition.rainy:
      case WeatherCondition.drizzle:
      case WeatherCondition.stormy:
        return AppColors.info;
      case WeatherCondition.windy:
        return AppColors.offlineIndicator;
    }
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
              width: AppSpacing.iconSizeXLarge,
              height: AppSpacing.iconSizeXLarge,
              decoration: BoxDecoration(
                color: _iconColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(_icon, color: _iconColor, size: 28),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.location,
                    style: AppTypography.labelMedium.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Row(
                    children: [
                      Text(
                        '${entity.temperature.round()}°C',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (entity.isOfflineCached) ...[
                        const SizedBox(width: AppSpacing.sm),
                        _CachedBadge(),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _Stat(icon: Icons.opacity_rounded, value: '${entity.humidity}%'),
                const SizedBox(height: AppSpacing.xs),
                _Stat(
                  icon: Icons.air_rounded,
                  value: '${entity.windSpeed.round()} km/h',
                ),
              ],
            ),
            const SizedBox(width: AppSpacing.xs),
            Icon(
              Icons.chevron_right_rounded,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.icon, required this.value});
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 12,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: AppSpacing.xxs),
        Text(
          value,
          style: AppTypography.labelSmall.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _CachedBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: const BoxDecoration(
        color: AppColors.offlineContainer,
        borderRadius: AppRadius.extraSmallAll,
      ),
      child: Text(
        'Cached',
        style: AppTypography.labelSmall.copyWith(
          color: AppColors.offlineIndicator,
        ),
      ),
    );
  }
}
