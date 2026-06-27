import '../../domain/entities/market_price_entity.dart';

/// Data-layer model for [MarketPriceEntity].
final class MarketPriceModel {
  const MarketPriceModel({
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
  final double priceChange;
  final DateTime lastUpdated;

  factory MarketPriceModel.fromMap(Map<String, dynamic> map) =>
      MarketPriceModel(
        cropName: map['crop_name'] as String,
        pricePerUnit: (map['price_per_unit'] as num).toDouble(),
        unit: map['unit'] as String,
        market: map['market'] as String,
        priceChange: (map['price_change'] as num).toDouble(),
        lastUpdated: DateTime.parse(map['last_updated'] as String),
      );

  MarketPriceEntity toEntity() => MarketPriceEntity(
        cropName: cropName,
        pricePerUnit: pricePerUnit,
        unit: unit,
        market: market,
        priceChange: priceChange,
        lastUpdated: lastUpdated,
      );
}
