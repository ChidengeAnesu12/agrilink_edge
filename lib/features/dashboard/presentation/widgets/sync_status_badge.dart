import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../controllers/sync_controller.dart';

/// Compact sync status pill for the app bar.
class SyncStatusBadge extends ConsumerWidget {
  const SyncStatusBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncAsync = ref.watch(syncStatusProvider);
    return syncAsync.when(
      data: (status) {
        if (status.isSyncing) {
          return const _Badge(
            color: AppColors.syncPending,
            icon: Icons.sync_rounded,
            label: 'Syncing',
          );
        }
        if (status.hasFailures) {
          return _Badge(
            color: AppColors.syncFailed,
            icon: Icons.cloud_off_rounded,
            label: '${status.failedItems} failed',
          );
        }
        if (status.hasPendingItems) {
          return _Badge(
            color: AppColors.syncPending,
            icon: Icons.pending_rounded,
            label: '${status.pendingUploads} pending',
          );
        }
        if (!status.isOnline) {
          return const _Badge(
            color: AppColors.offlineIndicator,
            icon: Icons.wifi_off_rounded,
            label: 'Offline',
          );
        }
        return const SizedBox.shrink();
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: const BorderRadius.all(Radius.circular(999)),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: AppSpacing.xxs),
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
