import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

import '../../../../routes/app_router.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/alert_item_card.dart';
import '../widgets/farm_health_card.dart';
import '../widgets/greeting_widget.dart';
import '../widgets/market_price_card.dart';
import '../widgets/quick_actions_grid.dart';
import '../widgets/recent_diagnosis_card.dart';
import '../widgets/section_header.dart';
import '../widgets/skeleton_card.dart';
import '../widgets/sync_status_badge.dart';
import '../widgets/weather_summary_card.dart';

/// SCREEN 009 — Dashboard
///
/// The heart of AgriLink Edge. Answers three questions:
/// How is my farm? What needs attention? What should I do next?
///
/// Offline: All cached content displayed. Sync status visible.
/// Loading: Skeleton cards shown for every section.
/// Error: Actionable error message with retry.
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashAsync = ref.watch(dashboardControllerProvider);

    return Scaffold(
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () =>
            ref.read(dashboardControllerProvider.notifier).refresh(),
        child: dashAsync.when(
          data: (state) => _DashboardBody(state: state),
          loading: () => const _DashboardSkeleton(),
          error: (e, __) => _DashboardError(
            message: e.toString(),
            onRetry: () =>
                ref.read(dashboardControllerProvider.notifier).refresh(),
          ),
        ),
      ),
    );
  }
}

// ── Dashboard Body ─────────────────────────────────────────────────────────

class _DashboardBody extends StatelessWidget {
  const _DashboardBody({required this.state});
  final DashboardState state;

  bool get _isRefreshing => state is DashboardRefreshing;

  DashboardData? get _data {
    if (state is DashboardSuccess) return (state as DashboardSuccess).data;
    if (state is DashboardRefreshing) {
      return (state as DashboardRefreshing).previousData;
    }
    return null;
  }

  List<QuickAction> _quickActions(BuildContext context) => [
        QuickAction(
          label: 'Scan',
          icon: Icons.document_scanner_rounded,
          color: AppColors.aiColor,
          backgroundColor: AppColors.aiColorContainer,
          onTap: () => _navigate(context, AppRoutes.scan),
        ),
        QuickAction(
          label: 'Weather',
          icon: Icons.wb_sunny_rounded,
          color: AppColors.accent,
          backgroundColor: AppColors.accentContainer,
          onTap: () => _navigate(context, AppRoutes.weather),
        ),
        QuickAction(
          label: 'Market',
          icon: Icons.storefront_rounded,
          color: AppColors.marketplaceColor,
          backgroundColor: AppColors.marketplaceContainer,
          onTap: () => _navigate(context, AppRoutes.marketplace),
        ),
        QuickAction(
          label: 'Maps',
          icon: Icons.map_rounded,
          color: AppColors.gisColor,
          backgroundColor: AppColors.gisColorContainer,
          onTap: () => _navigate(context, AppRoutes.maps),
        ),
        QuickAction(
          label: 'Voice',
          icon: Icons.mic_rounded,
          color: AppColors.secondary,
          backgroundColor: AppColors.secondaryContainer,
          onTap: () => _navigate(context, AppRoutes.voiceAssistant),
        ),
        QuickAction(
          label: 'Reports',
          icon: Icons.description_rounded,
          color: AppColors.primary,
          backgroundColor: AppColors.primaryContainer,
          onTap: () => _navigate(context, AppRoutes.reports),
        ),
        QuickAction(
          label: 'Community',
          icon: Icons.groups_rounded,
          color: AppColors.primary,
          backgroundColor: AppColors.primaryContainer,
          onTap: () => _navigate(context, AppRoutes.community),
        ),
        QuickAction(
          label: 'Offline',
          icon: Icons.cloud_download_rounded,
          color: AppColors.offlineIndicator,
          backgroundColor: AppColors.offlineContainer,
          onTap: () => _navigate(context, AppRoutes.offlineCenter),
        ),
      ];

  void _navigate(BuildContext context, String routeName) {
    try {
      GoRouter.of(context).goNamed(routeName);
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Coming soon in a future phase.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = _data;

    return CustomScrollView(
      slivers: [
        // ── App Bar ────────────────────────────────────────────────────
        SliverAppBar(
          floating: true,
          snap: true,
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: const _AppBarLogo(),
          actions: const [
            SyncStatusBadge(),
            SizedBox(width: AppSpacing.sm),
            _VoiceButton(),
            SizedBox(width: AppSpacing.md),
          ],
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPaddingMobile,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: AppSpacing.md),

              // ── Greeting ──────────────────────────────────────────────
              GreetingWidget(
                farmerName: 'Farmer',
                notificationCount:
                    data?.alerts.where((a) => a.isRead == false).length ?? 0,
                onNotificationTap: () =>
                    _navigate(context, AppRoutes.notifications),
              ),
              const SizedBox(height: AppSpacing.xl),

              // ── Farm Health ───────────────────────────────────────────
              if (_isRefreshing || data == null)
                const SkeletonCard()
              else
                FarmHealthCard(
                  entity: data.farmHealth,
                  onTap: () => _navigate(context, AppRoutes.farm),
                ),
              const SizedBox(height: AppSpacing.md),

              // ── Weather ───────────────────────────────────────────────
              if (_isRefreshing || data == null)
                const SkeletonCard(height: 80)
              else
                WeatherSummaryCard(
                  entity: data.weather,
                  onTap: () => _navigate(context, AppRoutes.weather),
                ),
              const SizedBox(height: AppSpacing.xl),

              // ── Quick Actions ─────────────────────────────────────────
              const SectionHeader(title: 'Quick Actions'),
              const SizedBox(height: AppSpacing.md),
              QuickActionsGrid(actions: _quickActions(context)),
              const SizedBox(height: AppSpacing.xl),

              // ── Alerts ────────────────────────────────────────────────
              if (data != null && data.alerts.isNotEmpty) ...[
                SectionHeader(
                  title: 'Alerts',
                  onSeeAll: () => _navigate(context, AppRoutes.notifications),
                ),
                const SizedBox(height: AppSpacing.md),
                ...data.alerts.take(3).map(
                      (a) => Padding(
                        padding:
                            const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: AlertItemCard(alert: a),
                      ),
                    ),
                const SizedBox(height: AppSpacing.xl),
              ],

              // ── Market Prices ─────────────────────────────────────────
              if (data != null && data.marketPrices.isNotEmpty) ...[
                SectionHeader(
                  title: 'Market Prices',
                  onSeeAll: () => _navigate(context, AppRoutes.marketplace),
                ),
                const SizedBox(height: AppSpacing.md),
                SizedBox(
                  height: 148,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.marketPrices.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: AppSpacing.sm),
                    itemBuilder: (_, i) =>
                        MarketPriceCard(entity: data.marketPrices[i]),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
              ],

              // ── Recent Diagnoses ──────────────────────────────────────
              SectionHeader(
                title: 'Recent Diagnoses',
                onSeeAll: () =>
                    _navigate(context, AppRoutes.diagnosisHistory),
              ),
              const SizedBox(height: AppSpacing.md),
              RecentDiagnosisCard(
                cropName: 'Maize',
                diseaseName: 'Gray Leaf Spot',
                confidence: 87,
                severity: 'High',
                timestamp:
                    DateTime.now().subtract(const Duration(hours: 2)),
              ),
              const SizedBox(height: AppSpacing.sm),
              RecentDiagnosisCard(
                cropName: 'Tobacco',
                diseaseName: 'Blue Mould',
                confidence: 94,
                severity: 'Critical',
                timestamp:
                    DateTime.now().subtract(const Duration(days: 1)),
              ),
              const SizedBox(height: AppSpacing.xxxl),
            ]),
          ),
        ),
      ],
    );
  }
}

// ── App Bar Components ─────────────────────────────────────────────────────

class _AppBarLogo extends StatelessWidget {
  const _AppBarLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          child: const Icon(
            Icons.eco_rounded,
            size: 18,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(
          'AgriLink Edge',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
              ),
        ),
      ],
    );
  }
}

class _VoiceButton extends StatelessWidget {
  const _VoiceButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.mic_rounded),
      tooltip: 'Voice Assistant',
      onPressed: () {
        try {
          GoRouter.of(context).goNamed(AppRoutes.voiceAssistant);
        } catch (_) {}
      },
    );
  }
}

// ── Loading State ──────────────────────────────────────────────────────────

class _DashboardSkeleton extends StatelessWidget {
  const _DashboardSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.screenPaddingMobile),
      children: const [
        SkeletonCard(height: 60),
        SizedBox(height: AppSpacing.xl),
        SkeletonCard(),
        SizedBox(height: AppSpacing.md),
        SkeletonCard(height: 80),
        SizedBox(height: AppSpacing.xl),
        SkeletonCard(height: 160),
        SizedBox(height: AppSpacing.xl),
        SkeletonCard(height: 80),
        SizedBox(height: AppSpacing.sm),
        SkeletonCard(height: 80),
        SizedBox(height: AppSpacing.sm),
        SkeletonCard(height: 80),
      ],
    );
  }
}

// ── Error State ────────────────────────────────────────────────────────────

class _DashboardError extends StatelessWidget {
  const _DashboardError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenPaddingMobile),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: AppSpacing.iconSizeXLarge,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Unable to load dashboard',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              message,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
