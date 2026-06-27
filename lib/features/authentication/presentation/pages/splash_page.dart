import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_animation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../routes/app_router.dart';
import '../controllers/splash_controller.dart';

/// SCREEN 001 — Splash Screen
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: AppAnimation.emphasized,
    );
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _scaleAnim = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _animController.forward().then((_) {
      if (mounted) {
        ref.read(splashControllerProvider.notifier).initialize();
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _navigate(SplashState splashState) {
    if (splashState is SplashNavigateToOnboarding) {
      context.goNamed(AppRoutes.onboarding);
    } else if (splashState is SplashNavigateToDashboard) {
      context.goNamed(AppRoutes.dashboard);
    } else if (splashState is SplashNavigateToLogin) {
      context.goNamed(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<SplashState>>(
      splashControllerProvider,
      (_, next) => next.whenData(_navigate),
    );

    final splashAsync = ref.watch(splashControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPaddingMobile,
          ),
          child: Column(
            children: [
              const Spacer(flex: 2),
              FadeTransition(
                opacity: _fadeAnim,
                child: ScaleTransition(
                  scale: _scaleAnim,
                  child: Container(
                    width: AppSpacing.iconSizeDisplay,
                    height: AppSpacing.iconSizeDisplay,
                    decoration: const BoxDecoration(
                      color: AppColors.onPrimary,
                      borderRadius: AppRadius.largeAll,
                    ),
                    child: const Icon(
                      Icons.eco_rounded,
                      size: AppSpacing.iconSizeXLarge,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              FadeTransition(
                opacity: _fadeAnim,
                child: Column(
                  children: [
                    Text(
                      'AgriLink Edge',
                      style: AppTypography.headlineLarge.copyWith(
                        color: AppColors.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'AI-Powered Agriculture for Africa',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.primaryContainer,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              splashAsync.when(
                data: (s) => _LoadingStatus(
                  state: s,
                  onRetry: () => ref
                      .read(splashControllerProvider.notifier)
                      .initialize(),
                ),
                loading: () => const _LoadingStatus(
                  state: SplashInitializing(message: 'Starting...'),
                ),
                error: (_, __) => _LoadingStatus(
                  state: const SplashError(
                    message: 'Failed to start. Please try again.',
                  ),
                  onRetry: () => ref
                      .read(splashControllerProvider.notifier)
                      .initialize(),
                ),
              ),
              const SizedBox(height: AppSpacing.xxxl),
              FadeTransition(
                opacity: _fadeAnim,
                child: Text(
                  'Version 1.0.0',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.primaryContainer,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingStatus extends StatelessWidget {
  const _LoadingStatus({required this.state, this.onRetry});

  final SplashState state;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    if (state is SplashError) {
      return Column(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: AppColors.accent,
            size: 32,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            (state as SplashError).message,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primaryContainer,
            ),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: AppSpacing.md),
            TextButton(
              onPressed: onRetry,
              child: Text(
                'Try Again',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.accent,
                ),
              ),
            ),
          ],
        ],
      );
    }

    final String msg = state is SplashInitializing
        ? (state as SplashInitializing).message
        : 'Initializing...';

    return Column(
      children: [
        const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: AppColors.accent,
            strokeWidth: 2.0,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          msg,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.primaryContainer,
          ),
        ),
      ],
    );
  }
}
