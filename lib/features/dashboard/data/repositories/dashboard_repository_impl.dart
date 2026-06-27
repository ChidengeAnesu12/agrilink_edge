import '../../../../core/errors/app_error.dart';
import '../../bridge/dashboard_bridge.dart';
import '../../domain/entities/alert_entity.dart';
import '../../domain/entities/farm_health_entity.dart';
import '../../domain/entities/market_price_entity.dart';
import '../../domain/entities/sync_status_entity.dart';
import '../../domain/entities/weather_summary_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../models/alert_model.dart';
import '../models/farm_health_model.dart';
import '../models/market_price_model.dart';
import '../models/sync_status_model.dart';
import '../models/weather_summary_model.dart';

/// Implements [DashboardRepository] via [DashboardBridge].
final class DashboardRepositoryImpl implements DashboardRepository {
  const DashboardRepositoryImpl({required DashboardBridge bridge})
      : _bridge = bridge;

  final DashboardBridge _bridge;

  @override
  Future<({FarmHealthEntity? data, AppError? error})>
      getFarmHealth() async {
    try {
      final map = await _bridge.getFarmHealth();
      return (data: FarmHealthModel.fromMap(map).toEntity(), error: null);
    } on Exception catch (e) {
      return (data: null, error: UnexpectedError(message: e.toString()));
    }
  }

  @override
  Future<({WeatherSummaryEntity? data, AppError? error})>
      getWeatherSummary() async {
    try {
      final map = await _bridge.getWeatherSummary();
      return (
        data: WeatherSummaryModel.fromMap(map).toEntity(),
        error: null,
      );
    } on Exception catch (e) {
      return (data: null, error: UnexpectedError(message: e.toString()));
    }
  }

  @override
  Future<({List<AlertEntity>? data, AppError? error})> getAlerts() async {
    try {
      final list = await _bridge.getAlerts();
      return (
        data: list.map((m) => AlertModel.fromMap(m).toEntity()).toList(),
        error: null,
      );
    } on Exception catch (e) {
      return (data: null, error: UnexpectedError(message: e.toString()));
    }
  }

  @override
  Future<({List<MarketPriceEntity>? data, AppError? error})>
      getMarketPrices() async {
    try {
      final list = await _bridge.getMarketPrices();
      return (
        data:
            list.map((m) => MarketPriceModel.fromMap(m).toEntity()).toList(),
        error: null,
      );
    } on Exception catch (e) {
      return (data: null, error: UnexpectedError(message: e.toString()));
    }
  }

  @override
  Future<SyncStatusEntity> getSyncStatus() async {
    try {
      final map = await _bridge.getSyncStatus();
      return SyncStatusModel.fromMap(map).toEntity();
    } on Exception {
      return const SyncStatusEntity(
        isOnline: false,
        isSyncing: false,
        pendingUploads: 0,
        failedItems: 0,
        queueSize: 0,
      );
    }
  }

  @override
  Stream<SyncStatusEntity> watchSyncStatus() => _bridge
      .watchSyncStatus()
      .map((map) => SyncStatusModel.fromMap(map).toEntity());
}
