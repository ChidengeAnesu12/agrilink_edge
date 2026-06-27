import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bridge/auth_bridge.dart';
import '../../domain/entities/user_entity.dart';
import '../providers/auth_providers.dart';

sealed class SplashState {
  const SplashState();
}

final class SplashInitial extends SplashState {
  const SplashInitial();
}

final class SplashInitializing extends SplashState {
  const SplashInitializing({required this.message});
  final String message;
}

final class SplashNavigateToOnboarding extends SplashState {
  const SplashNavigateToOnboarding();
}

final class SplashNavigateToDashboard extends SplashState {
  const SplashNavigateToDashboard({required this.user});
  final UserEntity user;
}

final class SplashNavigateToLogin extends SplashState {
  const SplashNavigateToLogin();
}

final class SplashError extends SplashState {
  const SplashError({required this.message});
  final String message;
}

class SplashController extends AsyncNotifier<SplashState> {
  @override
  Future<SplashState> build() async => const SplashInitial();

  Future<void> initialize() async {
    final AuthBridge bridge = ref.read(authBridgeProvider);
    final repository = ref.read(authRepositoryProvider);

    state = const AsyncData(
      SplashInitializing(message: 'Initializing...'),
    );

    final kernelResult = await bridge.initializeKernel();
    if (kernelResult.error != null) {
      state = AsyncData(SplashError(message: kernelResult.error!));
      return;
    }

    state = const AsyncData(
      SplashInitializing(message: 'Loading AI models...'),
    );
    await Future<void>.delayed(const Duration(milliseconds: 400));

    state = const AsyncData(
      SplashInitializing(message: 'Preparing database...'),
    );
    await Future<void>.delayed(const Duration(milliseconds: 300));

    state = const AsyncData(
      SplashInitializing(message: 'Checking authentication...'),
    );

    final currentUser = await repository.getCurrentUser();

    if (currentUser == null) {
      state = const AsyncData(SplashNavigateToOnboarding());
    } else if (currentUser.isOnboardingComplete) {
      state = AsyncData(SplashNavigateToDashboard(user: currentUser));
    } else {
      state = const AsyncData(SplashNavigateToLogin());
    }
  }
}

final splashControllerProvider =
    AsyncNotifierProvider<SplashController, SplashState>(
  SplashController.new,
);
