import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_animation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../routes/app_router.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_dot_indicator.dart';
import '../widgets/onboarding_page_content.dart';

/// SCREEN 002–004 — Onboarding (7 pages)
class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late final PageController _pageController;

  static const List<_PageData> _pages = [
    _PageData(
      title: 'Welcome to AgriLink Edge',
      description:
          'The most advanced offline-first agricultural intelligence platform in Africa.',
      icon: Icons.eco_rounded,
      iconColor: AppColors.primary,
      bg: AppColors.primaryContainer,
    ),
    _PageData(
      title: 'Works Without Internet',
      description:
          'AI diagnosis, farm management, and weather — fully available offline.',
      icon: Icons.wifi_off_rounded,
      iconColor: AppColors.offlineIndicator,
      bg: AppColors.offlineContainer,
    ),
    _PageData(
      title: 'Diagnose Crop Diseases',
      description:
          'Point your camera at any crop. On-device AI identifies diseases in seconds.',
      icon: Icons.document_scanner_rounded,
      iconColor: AppColors.aiColor,
      bg: AppColors.aiColorContainer,
    ),
    _PageData(
      title: 'Farmer-to-Farmer Network',
      description:
          'Connect with nearby farmers using Bluetooth mesh — no internet required.',
      icon: Icons.groups_rounded,
      iconColor: AppColors.secondary,
      bg: AppColors.secondaryContainer,
    ),
    _PageData(
      title: 'Live Weather Intelligence',
      description:
          'Hyperlocal forecasts and spray advisories tailored to your exact farm.',
      icon: Icons.wb_sunny_rounded,
      iconColor: AppColors.accent,
      bg: AppColors.accentContainer,
    ),
    _PageData(
      title: 'Find Markets and Buyers',
      description:
          'Real-time prices, nearby buyers, and direct selling — all in one place.',
      icon: Icons.storefront_rounded,
      iconColor: AppColors.marketplaceColor,
      bg: AppColors.marketplaceContainer,
    ),
    _PageData(
      title: 'Government Collaboration',
      description:
          'Connect with AGRITEX extension officers and access national support.',
      icon: Icons.account_balance_rounded,
      iconColor: AppColors.gisColor,
      bg: AppColors.gisColorContainer,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _next(OnboardingState s) {
    if (s.isLastPage) {
      context.goNamed(AppRoutes.login);
      return;
    }
    ref.read(onboardingControllerProvider.notifier).nextPage();
    _pageController.nextPage(
      duration: AppAnimation.standard,
      curve: AppAnimation.pageCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingControllerProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPaddingMobile,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryContainer,
                          borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Icon(
                          Icons.eco_rounded,
                          size: 20,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        'AgriLink Edge',
                        style: AppTypography.titleSmall.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  if (!state.isLastPage)
                    TextButton(
                      onPressed: () => context.goNamed(AppRoutes.login),
                      child: Text(
                        'Skip',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurfaceMediumLight,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (i) => ref
                    .read(onboardingControllerProvider.notifier)
                    .goToPage(i),
                itemBuilder: (_, i) => OnboardingPageContent(
                  icon: _pages[i].icon,
                  iconColor: _pages[i].iconColor,
                  iconBackgroundColor: _pages[i].bg,
                  title: _pages[i].title,
                  description: _pages[i].description,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenPaddingMobile,
                AppSpacing.lg,
                AppSpacing.screenPaddingMobile,
                AppSpacing.xxl,
              ),
              child: Column(
                children: [
                  OnboardingDotIndicator(
                    currentPage: state.currentPage,
                    totalPages: state.totalPages,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  SizedBox(
                    width: double.infinity,
                    height: AppSpacing.touchTarget,
                    child: ElevatedButton(
                      onPressed: () => _next(state),
                      child: Text(
                        state.isLastPage ? 'Get Started' : 'Next',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _PageData {
  const _PageData({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.bg,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color bg;
}
