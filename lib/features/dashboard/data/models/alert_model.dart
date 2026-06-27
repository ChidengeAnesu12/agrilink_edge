import '../../domain/entities/alert_entity.dart';

/// Data-layer model for [AlertEntity].
final class AlertModel {
  const AlertModel({
    required this.id,
    required this.title,
    required this.message,
    required this.severity,
    required this.type,
    required this.timestamp,
    required this.isRead,
  });

  final String id;
  final String title;
  final String message;
  final String severity;
  final String type;
  final DateTime timestamp;
  final bool isRead;

  factory AlertModel.fromMap(Map<String, dynamic> map) => AlertModel(
        id: map['id'] as String,
        title: map['title'] as String,
        message: map['message'] as String,
        severity: map['severity'] as String? ?? 'low',
        type: map['type'] as String? ?? 'ai',
        timestamp: DateTime.parse(map['timestamp'] as String),
        isRead: map['is_read'] as bool? ?? false,
      );

  AlertSeverity get _severityEnum {
    switch (severity) {
      case 'critical':
        return AlertSeverity.critical;
      case 'high':
        return AlertSeverity.high;
      case 'medium':
        return AlertSeverity.medium;
      default:
        return AlertSeverity.low;
    }
  }

  AlertType get _typeEnum {
    switch (type) {
      case 'ai':
        return AlertType.ai;
      case 'weather':
        return AlertType.weather;
      case 'sync':
        return AlertType.sync;
      case 'market':
        return AlertType.market;
      case 'government':
        return AlertType.government;
      case 'community':
        return AlertType.community;
      case 'emergency':
        return AlertType.emergency;
      default:
        return AlertType.ai;
    }
  }

  AlertEntity toEntity() => AlertEntity(
        id: id,
        title: title,
        message: message,
        severity: _severityEnum,
        type: _typeEnum,
        timestamp: timestamp,
        isRead: isRead,
      );
}
