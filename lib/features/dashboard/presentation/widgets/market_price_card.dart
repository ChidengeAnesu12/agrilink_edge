import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/market_price_entity.dart';

/// Market price card for the dashboard horizontal carousel.
class MarketPriceCard extends StatelessWidget {
  const MarketPriceCard({
    super.key,
    required this.entity,
    this.onTap,
  });

  final MarketPriceEntity entity;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isRising = entity.isRising;
    final Color changeColor = isRising ? AppColors.success : AppColors.error;
    final IconData changeIcon = isRising
        ? Icons.trending_up_rounded
        : Icons.trending_down_rounded;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: AppRadius.mediumAll,
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: AppColors.marketplaceContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.storefront_rounded,
                    color: AppColors.marketplaceColor,
                    size: 16,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs,
                    vertical: AppSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: changeColor.withValues(alpha: 0.1),
                    borderRadius: AppRadius.extraSmallAll,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(changeIcon, size: 10, color: changeColor),
                      const SizedBox(width: 2),
                      Text(
                        entity.priceChange.abs().toStringAsFixed(0),
                        style: AppTypography.labelSmall.copyWith(
                          color: changeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              entity.cropName,
              style: AppTypography.titleSmall,
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              'USD ${entity.pricePerUnit.toStringAsFixed(0)}',
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.marketplaceColor,
              ),
            ),
            Text(
              entity.unit,
              style: AppTypography.labelSmall.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
