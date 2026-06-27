import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_animation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../controllers/sync_controller.dart';

/// App-wide offline status banner.
///
/// Shown at the top of every screen when connectivity is lost.
/// Animated in and out as status changes.
class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncAsync = ref.watch(syncStatusProvider);
    final bool isOffline = syncAsync.when(
      data: (s) => !s.isOnline,
      loading: () => false,
      error: (_, __) => true,
    );

    return AnimatedSize(
      duration: AppAnimation.standard,
      curve: AppAnimation.standardCurve,
      child: isOffline ? const _OfflineBannerContent() : const SizedBox.shrink(),
    );
  }
}

class _OfflineBannerContent extends StatelessWidget {
  const _OfflineBannerContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.offlineIndicator,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPaddingMobile,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off_rounded,
            color: AppColors.onPrimary,
            size: 14,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            'Offline — data saved locally',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
