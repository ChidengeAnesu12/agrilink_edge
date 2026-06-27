import '../../domain/entities/farm_health_entity.dart';

/// Data-layer model for [FarmHealthEntity].
final class FarmHealthModel {
  const FarmHealthModel({
    required this.score,
    required this.status,
    required this.activeAlerts,
    required this.activeDiseases,
    required this.lastUpdated,
    required this.recommendations,
  });

  final double score;
  final String status;
  final int activeAlerts;
  final int activeDiseases;
  final DateTime lastUpdated;
  final List<String> recommendations;

  factory FarmHealthModel.fromMap(Map<String, dynamic> map) => FarmHealthModel(
        score: (map['score'] as num).toDouble(),
        status: map['status'] as String? ?? 'good',
        activeAlerts: map['active_alerts'] as int? ?? 0,
        activeDiseases: map['active_diseases'] as int? ?? 0,
        lastUpdated: map['last_updated'] != null
            ? DateTime.parse(map['last_updated'] as String)
            : DateTime.now(),
        recommendations: (map['recommendations'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
      );

  FarmHealthStatus get _statusEnum {
    switch (status) {
      case 'excellent':
        return FarmHealthStatus.excellent;
      case 'good':
        return FarmHealthStatus.good;
      case 'fair':
        return FarmHealthStatus.fair;
      case 'poor':
        return FarmHealthStatus.poor;
      case 'critical':
        return FarmHealthStatus.critical;
      default:
        return FarmHealthStatus.good;
    }
  }

  FarmHealthEntity toEntity() => FarmHealthEntity(
        score: score,
        status: _statusEnum,
        activeAlerts: activeAlerts,
        activeDiseases: activeDiseases,
        lastUpdated: lastUpdated,
        recommendations: recommendations,
      );
}
