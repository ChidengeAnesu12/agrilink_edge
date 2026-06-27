import '../../domain/entities/weather_summary_entity.dart';

/// Data-layer model for [WeatherSummaryEntity].
final class WeatherSummaryModel {
  const WeatherSummaryModel({
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.rainfall,
    required this.location,
    required this.isOfflineCached,
  });

  final double temperature;
  final double feelsLike;
  final String condition;
  final int humidity;
  final double windSpeed;
  final double rainfall;
  final String location;
  final bool isOfflineCached;

  factory WeatherSummaryModel.fromMap(Map<String, dynamic> map) =>
      WeatherSummaryModel(
        temperature: (map['temperature'] as num).toDouble(),
        feelsLike: (map['feels_like'] as num).toDouble(),
        condition: map['condition'] as String? ?? 'sunny',
        humidity: map['humidity'] as int? ?? 50,
        windSpeed: (map['wind_speed'] as num).toDouble(),
        rainfall: (map['rainfall'] as num).toDouble(),
        location: map['location'] as String? ?? '',
        isOfflineCached: map['is_offline_cached'] as bool? ?? false,
      );

  WeatherCondition get _conditionEnum {
    switch (condition) {
      case 'sunny':
        return WeatherCondition.sunny;
      case 'partlyCloudy':
        return WeatherCondition.partlyCloudy;
      case 'cloudy':
        return WeatherCondition.cloudy;
      case 'rainy':
        return WeatherCondition.rainy;
      case 'stormy':
        return WeatherCondition.stormy;
      case 'drizzle':
        return WeatherCondition.drizzle;
      case 'windy':
        return WeatherCondition.windy;
      default:
        return WeatherCondition.partlyCloudy;
    }
  }

  WeatherSummaryEntity toEntity() => WeatherSummaryEntity(
        temperature: temperature,
        feelsLike: feelsLike,
        condition: _conditionEnum,
        humidity: humidity,
        windSpeed: windSpeed,
        rainfall: rainfall,
        location: location,
        isOfflineCached: isOfflineCached,
      );
}
