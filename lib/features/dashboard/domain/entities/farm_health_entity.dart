import 'package:equatable/equatable.dart';

/// Health status levels for a farm.
enum FarmHealthStatus { excellent, good, fair, poor, critical }

extension FarmHealthStatusX on FarmHealthStatus {
  String get label {
    switch (this) {
      case FarmHealthStatus.excellent:
        return 'Excellent';
      case FarmHealthStatus.good:
        return 'Good';
      case FarmHealthStatus.fair:
        return 'Fair';
      case FarmHealthStatus.poor:
        return 'Poor';
      case FarmHealthStatus.critical:
        return 'Critical';
    }
  }
}

/// Immutable domain entity representing overall farm health.
final class FarmHealthEntity extends Equatable {
  const FarmHealthEntity({
    required this.score,
    required this.status,
    required this.activeAlerts,
    required this.activeDiseases,
    required this.lastUpdated,
    this.recommendations = const [],
  });

  final double score;
  final FarmHealthStatus status;
  final int activeAlerts;
  final int activeDiseases;
  final DateTime lastUpdated;
  final List<String> recommendations;

  @override
  List<Object?> get props => [
        score,
        status,
        activeAlerts,
        activeDiseases,
        lastUpdated,
        recommendations,
      ];
}
