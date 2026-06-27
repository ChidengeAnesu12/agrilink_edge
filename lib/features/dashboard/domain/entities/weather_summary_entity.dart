import 'package:equatable/equatable.dart';

/// Current weather condition.
enum WeatherCondition {
  sunny,
  partlyCloudy,
  cloudy,
  rainy,
  stormy,
  drizzle,
  windy,
}

/// Immutable domain entity for the weather summary card.
final class WeatherSummaryEntity extends Equatable {
  const WeatherSummaryEntity({
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.rainfall,
    required this.location,
    this.isOfflineCached = false,
  });

  final double temperature;
  final double feelsLike;
  final WeatherCondition condition;
  final int humidity;
  final double windSpeed;
  final double rainfall;
  final String location;
  final bool isOfflineCached;

  @override
  List<Object?> get props => [
        temperature,
        feelsLike,
        condition,
        humidity,
        windSpeed,
        rainfall,
        location,
        isOfflineCached,
      ];
}
