import '../../domain/entities/sync_status_entity.dart';

/// Data-layer model for [SyncStatusEntity].
final class SyncStatusModel {
  const SyncStatusModel({
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

  factory SyncStatusModel.fromMap(Map<String, dynamic> map) => SyncStatusModel(
        isOnline: map['is_online'] as bool? ?? false,
        isSyncing: map['is_syncing'] as bool? ?? false,
        pendingUploads: map['pending_uploads'] as int? ?? 0,
        failedItems: map['failed_items'] as int? ?? 0,
        queueSize: map['queue_size'] as int? ?? 0,
        lastSyncTime: map['last_sync_time'] != null
            ? DateTime.parse(map['last_sync_time'] as String)
            : null,
      );

  SyncStatusEntity toEntity() => SyncStatusEntity(
        isOnline: isOnline,
        isSyncing: isSyncing,
        pendingUploads: pendingUploads,
        failedItems: failedItems,
        queueSize: queueSize,
        lastSyncTime: lastSyncTime,
      );
}
