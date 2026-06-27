import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_animation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/farm_health_entity.dart';

/// Dashboard farm health card with animated arc gauge.
class FarmHealthCard extends StatelessWidget {
  const FarmHealthCard({
    super.key,
    required this.entity,
    this.onTap,
  });

  final FarmHealthEntity entity;
  final VoidCallback? onTap;

  Color get _scoreColor {
    if (entity.score >= 80) return AppColors.success;
    if (entity.score >= 60) return AppColors.secondary;
    if (entity.score >= 40) return AppColors.warning;
    return AppColors.error;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryDark, AppColors.primary],
          ),
          borderRadius: AppRadius.largeAll,
        ),
        child: Row(
          children: [
            _HealthGauge(score: entity.score, color: _scoreColor),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Farm Health',
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.primaryContainer,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    entity.status.label,
                    style: AppTypography.titleLarge.copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      _Chip(
                        icon: Icons.warning_rounded,
                        label: '${entity.activeAlerts} alerts',
                        highlighted: entity.activeAlerts > 0,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _Chip(
                        icon: Icons.coronavirus_rounded,
                        label: '${entity.activeDiseases} diseases',
                        highlighted: entity.activeDiseases > 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.primaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}

class _HealthGauge extends StatelessWidget {
  const _HealthGauge({required this.score, required this.color});
  final double score;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: score),
        duration: AppAnimation.slow,
        curve: AppAnimation.standardCurve,
        builder: (_, value, __) => CustomPaint(
          painter: _GaugePainter(score: value, color: color),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${value.round()}',
                  style: AppTypography.titleLarge.copyWith(
                    color: AppColors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '%',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.primaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  _GaugePainter({required this.score, required this.color});

  final double score;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;
    const startAngle = -math.pi * 0.75;
    const sweepFull = math.pi * 1.5;

    final trackPaint = Paint()
      ..color = AppColors.onPrimary.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepFull,
      false,
      trackPaint,
    );

    final scorePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepFull * (score / 100),
      false,
      scorePaint,
    );
  }

  @override
  bool shouldRepaint(_GaugePainter old) =>
      old.score != score || old.color != color;
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.icon,
    required this.label,
    this.highlighted = false,
  });

  final IconData icon;
  final String label;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.onPrimary.withValues(alpha: 0.12),
        borderRadius: AppRadius.circularAll,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: highlighted ? AppColors.accent : AppColors.primaryContainer,
          ),
          const SizedBox(width: AppSpacing.xxs),
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
