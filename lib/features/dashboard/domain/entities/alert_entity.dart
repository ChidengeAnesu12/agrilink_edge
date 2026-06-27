import 'package:equatable/equatable.dart';

/// Alert urgency levels.
enum AlertSeverity { low, medium, high, critical }

/// Source of an alert.
enum AlertType {
  ai,
  weather,
  sync,
  market,
  government,
  community,
  emergency,
}

/// Immutable domain entity representing a single alert.
final class AlertEntity extends Equatable {
  const AlertEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.severity,
    required this.type,
    required this.timestamp,
    this.isRead = false,
  });

  final String id;
  final String title;
  final String message;
  final AlertSeverity severity;
  final AlertType type;
  final DateTime timestamp;
  final bool isRead;

  @override
  List<Object?> get props => [
        id,
        title,
        message,
        severity,
        type,
        timestamp,
        isRead,
      ];
}
