import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_error.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';
import '../providers/dashboard_providers.dart';

sealed class DashboardState {
  const DashboardState();
}

final class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

final class DashboardSuccess extends DashboardState {
  const DashboardSuccess({required this.data});
  final DashboardData data;
}

final class DashboardError extends DashboardState {
  const DashboardError({required this.error});
  final AppError error;
}

final class DashboardOffline extends DashboardState {
  const DashboardOffline({this.cachedData});
  final DashboardData? cachedData;
}

final class DashboardRefreshing extends DashboardState {
  const DashboardRefreshing({required this.previousData});
  final DashboardData previousData;
}

/// Controls the dashboard screen state.
///
/// State lifecycle: Loading → Success | Error | Offline
/// Pull-to-refresh emits Refreshing first, then Success | Error.
class DashboardController extends AsyncNotifier<DashboardState> {
  @override
  Future<DashboardState> build() => _load();

  Future<DashboardState> _load() async {
    final result = await ref.read(getDashboardUseCaseProvider)();
    if (result.error != null) {
      if (result.error is OfflineError) {
        return const DashboardOffline();
      }
      return DashboardError(error: result.error!);
    }
    return DashboardSuccess(data: result.data!);
  }

  Future<void> refresh() async {
    final current = state.valueOrNull;
    if (current is DashboardSuccess) {
      state = AsyncData(DashboardRefreshing(previousData: current.data));
    }
    final next = await _load();
    state = AsyncData(next);
  }
}

final dashboardControllerProvider =
    AsyncNotifierProvider<DashboardController, DashboardState>(
  DashboardController.new,
);
