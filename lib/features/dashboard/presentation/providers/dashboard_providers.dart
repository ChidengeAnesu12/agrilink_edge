import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bridge/dashboard_bridge.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';

final dashboardBridgeProvider = Provider<DashboardBridge>(
  (_) => const DashboardBridge(),
);

final dashboardRepositoryProvider = Provider<DashboardRepository>(
  (ref) => DashboardRepositoryImpl(
    bridge: ref.watch(dashboardBridgeProvider),
  ),
);

final getDashboardUseCaseProvider = Provider<GetDashboardUseCase>(
  (ref) => GetDashboardUseCase(
    repository: ref.watch(dashboardRepositoryProvider),
  ),
);
