import 'package:equatable/equatable.dart';

/// Immutable domain entity representing the current sync state.
final class SyncStatusEntity extends Equatable {
  const SyncStatusEntity({
    required this.isOnline,
    required this.isSyncing,
    required this.pendingUploads,
    required this.failedItems,
    required this.queueSize,
    this.lastSyncTime,
  });

  final bool isOnline;
  final bool isSyncing;
  final int pendingUploads;
  final int failedItems;
  final int queueSize;
  final DateTime? lastSyncTime;

  bool get hasPendingItems => pendingUploads > 0 || queueSize > 0;
  bool get hasFailures => failedItems > 0;

  @override
  List<Object?> get props => [
        isOnline,
        isSyncing,
        pendingUploads,
        failedItems,
        queueSize,
        lastSyncTime,
      ];
}
