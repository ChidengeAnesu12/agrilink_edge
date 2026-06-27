import '../../../../core/errors/app_error.dart';
import '../entities/alert_entity.dart';
import '../entities/farm_health_entity.dart';
import '../entities/market_price_entity.dart';
import '../entities/weather_summary_entity.dart';
import '../repositories/dashboard_repository.dart';

/// Aggregated dashboard response.
final class DashboardData {
  const DashboardData({
    required this.farmHealth,
    required this.weather,
    required this.alerts,
    required this.marketPrices,
  });

  final FarmHealthEntity farmHealth;
  final WeatherSummaryEntity weather;
  final List<AlertEntity> alerts;
  final List<MarketPriceEntity> marketPrices;
}

/// Fetches all data needed to render the dashboard in one coordinated call.
final class GetDashboardUseCase {
  const GetDashboardUseCase({required DashboardRepository repository})
      : _repository = repository;

  final DashboardRepository _repository;

  Future<({DashboardData? data, AppError? error})> call() async {
    final healthResult = await _repository.getFarmHealth();
    if (healthResult.error != null) {
      return (data: null, error: healthResult.error);
    }

    final weatherResult = await _repository.getWeatherSummary();
    if (weatherResult.error != null) {
      return (data: null, error: weatherResult.error);
    }

    final alertsResult = await _repository.getAlerts();
    final marketResult = await _repository.getMarketPrices();

    return (
      data: DashboardData(
        farmHealth: healthResult.data!,
        weather: weatherResult.data!,
        alerts: alertsResult.data ?? [],
        marketPrices: marketResult.data ?? [],
      ),
      error: null,
    );
  }
}
