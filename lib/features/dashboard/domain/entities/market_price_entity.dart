import 'package:equatable/equatable.dart';

/// Immutable domain entity for a single market price entry.
final class MarketPriceEntity extends Equatable {
  const MarketPriceEntity({
    required this.cropName,
    required this.pricePerUnit,
    required this.unit,
    required this.market,
    required this.priceChange,
    required this.lastUpdated,
  });

  final String cropName;
  final double pricePerUnit;
  final String unit;
  final String market;

  /// Positive value means price rose. Negative means it fell.
  final double priceChange;
  final DateTime lastUpdated;

  bool get isRising => priceChange > 0;
  bool get isFalling => priceChange < 0;

  @override
  List<Object?> get props => [
        cropName,
        pricePerUnit,
        unit,
        market,
        priceChange,
        lastUpdated,
      ];
}
