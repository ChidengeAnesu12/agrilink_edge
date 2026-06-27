import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../controllers/sync_controller.dart';

/// SCREEN 015 — Offline Center
///
/// Storage usage, download queue, pending syncs, cached content.
class OfflineCenterPage extends ConsumerWidget {
  const OfflineCenterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncAsync = ref.watch(syncStatusProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Center'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.screenPaddingMobile),
        children: [
          // ── Connectivity ────────────────────────────────────────────
          syncAsync.when(
            data: (status) => _ConnectivityBanner(isOnline: status.isOnline),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          const SizedBox(height: AppSpacing.xl),

          // ── Storage Summary ─────────────────────────────────────────
          const _SectionTitle(title: 'Storage'),
          const SizedBox(height: AppSpacing.md),
          const _OfflineItem(
            icon: Icons.map_rounded,
            label: 'Cached Maps',
            detail: '24 MB',
            color: AppColors.gisColor,
          ),
          const _OfflineItem(
            icon: Icons.wb_sunny_rounded,
            label: 'Cached Weather',
            detail: '2 MB',
            color: AppColors.accent,
          ),
          const _OfflineItem(
            icon: Icons.storefront_rounded,
            label: 'Cached Market Prices',
            detail: '1 MB',
            color: AppColors.marketplaceColor,
          ),
          const _OfflineItem(
            icon: Icons.psychology_rounded,
            label: 'AI Models',
            detail: '248 MB',
            color: AppColors.aiColor,
          ),
          const SizedBox(height: AppSpacing.xl),

          // ── Pending Sync ────────────────────────────────────────────
          const _SectionTitle(title: 'Pending Sync'),
          const SizedBox(height: AppSpacing.md),
          syncAsync.when(
            data: (status) => _OfflineItem(
              icon: Icons.upload_rounded,
              label: 'Items to Upload',
              detail: '${status.pendingUploads} items',
              color: status.pendingUploads > 0
                  ? AppColors.syncPending
                  : AppColors.success,
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          const _OfflineItem(
            icon: Icons.biotech_rounded,
            label: 'Pending Diagnoses',
            detail: '2 diagnoses',
            color: AppColors.aiColor,
          ),
          const _OfflineItem(
            icon: Icons.agriculture_rounded,
            label: 'Farm Updates',
            detail: '1 update',
            color: AppColors.primary,
          ),
          const SizedBox(height: AppSpacing.xxl),

          // ── Manual Sync ─────────────────────────────────────────────
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchTarget,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sync_rounded),
              label: const Text('Sync All Pending'),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchTarget,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download_rounded),
              label: const Text('Download for Offline'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConnectivityBanner extends StatelessWidget {
  const _ConnectivityBanner({required this.isOnline});
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isOnline
            ? AppColors.successContainer
            : AppColors.offlineContainer,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Icon(
            isOnline ? Icons.wifi_rounded : Icons.wifi_off_rounded,
            color: isOnline ? AppColors.success : AppColors.offlineIndicator,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            isOnline
                ? 'Connected — sync is active'
                : 'Offline — data saved locally',
            style: AppTypography.bodyMedium.copyWith(
              color: isOnline
                  ? AppColors.onSuccessContainer
                  : AppColors.offlineIndicator,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTypography.titleSmall.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _OfflineItem extends StatelessWidget {
  const _OfflineItem({
    required this.icon,
    required this.label,
    required this.detail,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String detail;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Text(
            detail,
            style: AppTypography.labelMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
