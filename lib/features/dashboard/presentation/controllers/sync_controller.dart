import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/sync_status_entity.dart';
import '../providers/dashboard_providers.dart';

/// Live stream of sync status for the entire app.
///
/// Consumed by [OfflineBanner] and [SyncStatusBadge] globally.
final syncStatusProvider = StreamProvider<SyncStatusEntity>((ref) {
  final repo = ref.watch(dashboardRepositoryProvider);
  return repo.watchSyncStatus();
});
