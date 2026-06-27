import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../controllers/sync_controller.dart';

/// SCREEN 013 — Sync Status
///
/// Displays pending uploads, failures, queue size, and last sync time.
class SyncStatusPage extends ConsumerWidget {
  const SyncStatusPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncAsync = ref.watch(syncStatusProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Status'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: syncAsync.when(
        data: (status) => ListView(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingMobile),
          children: [
            _StatusCard(
              title: 'Connection',
              value: status.isOnline ? 'Online' : 'Offline',
              icon: status.isOnline
                  ? Icons.wifi_rounded
                  : Icons.wifi_off_rounded,
              color: status.isOnline
                  ? AppColors.success
                  : AppColors.offlineIndicator,
            ),
            const SizedBox(height: AppSpacing.md),
            _StatusCard(
              title: 'Pending Uploads',
              value: '${status.pendingUploads} items',
              icon: Icons.upload_rounded,
              color: status.pendingUploads > 0
                  ? AppColors.syncPending
                  : AppColors.success,
            ),
            const SizedBox(height: AppSpacing.md),
            _StatusCard(
              title: 'Failed Items',
              value: '${status.failedItems} items',
              icon: Icons.error_outline_rounded,
              color: status.failedItems > 0
                  ? AppColors.syncFailed
                  : AppColors.success,
            ),
            const SizedBox(height: AppSpacing.md),
            _StatusCard(
              title: 'Queue Size',
              value: '${status.queueSize} actions',
              icon: Icons.queue_rounded,
              color: AppColors.info,
            ),
            const SizedBox(height: AppSpacing.md),
            _StatusCard(
              title: 'Last Sync',
              value: status.lastSyncTime != null
                  ? _formatTime(status.lastSyncTime!)
                  : 'Never',
              icon: Icons.access_time_rounded,
              color: AppColors.primary,
            ),
            const SizedBox(height: AppSpacing.xxl),
            if (status.isOnline)
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchTarget,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.sync_rounded),
                  label: const Text('Sync Now'),
                ),
              ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(
          child: Text('Unable to load sync status.'),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.labelMedium.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  value,
                  style: AppTypography.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
