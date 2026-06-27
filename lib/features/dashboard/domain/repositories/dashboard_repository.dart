import '../../../../core/errors/app_error.dart';
import '../entities/alert_entity.dart';
import '../entities/farm_health_entity.dart';
import '../entities/market_price_entity.dart';
import '../entities/sync_status_entity.dart';
import '../entities/weather_summary_entity.dart';

/// Contract for all dashboard data operations.
abstract interface class DashboardRepository {
  Future<({FarmHealthEntity? data, AppError? error})> getFarmHealth();

  Future<({WeatherSummaryEntity? data, AppError? error})> getWeatherSummary();

  Future<({List<AlertEntity>? data, AppError? error})> getAlerts();

  Future<({List<MarketPriceEntity>? data, AppError? error})> getMarketPrices();

  Future<SyncStatusEntity> getSyncStatus();

  Stream<SyncStatusEntity> watchSyncStatus();
}
