import 'package:go_router/go_router.dart';

import '../../../routes/app_router.dart';
import '../presentation/pages/alerts_center_page.dart';
import '../presentation/pages/main_shell_page.dart';
import '../presentation/pages/offline_center_page.dart';
import '../presentation/pages/sync_status_page.dart';

/// All dashboard and shell routes.
final List<GoRoute> dashboardRoutes = [
  GoRoute(
    path: '/dashboard',
    name: AppRoutes.dashboard,
    builder: (_, __) => const MainShellPage(),
  ),
  GoRoute(
    path: '/alerts',
    name: AppRoutes.notifications,
    builder: (_, __) => const AlertsCenterPage(),
  ),
  GoRoute(
    path: '/sync',
    name: 'sync-status',
    builder: (_, __) => const SyncStatusPage(),
  ),
  GoRoute(
    path: '/offline',
    name: AppRoutes.offlineCenter,
    builder: (_, __) => const OfflineCenterPage(),
  ),
];
