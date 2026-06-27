import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/alert_item_card.dart';
import '../widgets/skeleton_card.dart';

/// SCREEN 012 — Alerts Center
///
/// Full list of all alerts grouped by severity.
class AlertsCenterPage extends ConsumerWidget {
  const AlertsCenterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashAsync = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: dashAsync.when(
        data: (state) {
          final data = state is DashboardSuccess
              ? state.data
              : null;

          if (data == null || data.alerts.isEmpty) {
            return _EmptyAlerts();
          }

          final unread = data.alerts.where((a) => !a.isRead).toList();
          final read = data.alerts.where((a) => a.isRead).toList();

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.screenPaddingMobile),
            children: [
              if (unread.isNotEmpty) ...[
                Text(
                  'New',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                ...unread.map(
                  (a) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: AlertItemCard(alert: a),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
              if (read.isNotEmpty) ...[
                Text(
                  'Earlier',
                  style: AppTypography.titleSmall.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                ...read.map(
                  (a) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: AlertItemCard(alert: a),
                  ),
                ),
              ],
            ],
          );
        },
        loading: () => const _AlertsSkeleton(),
        error: (_, __) => const Center(
          child: Text('Unable to load alerts.'),
        ),
      ),
    );
  }
}

class _EmptyAlerts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                Icons.notifications_none_rounded,
                color: AppColors.primary,
                size: 32,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'No alerts',
              style: AppTypography.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'You are up to date. Check back later.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _AlertsSkeleton extends StatelessWidget {
  const _AlertsSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.screenPaddingMobile),
      children: const [
        SkeletonCard(height: 80),
        SizedBox(height: AppSpacing.sm),
        SkeletonCard(height: 80),
        SizedBox(height: AppSpacing.sm),
        SkeletonCard(height: 80),
      ],
    );
  }
}
