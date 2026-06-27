/// AgriLink Edge — Dashboard Rust Bridge Stub
///
/// All methods route through flutter_rust_bridge to the Rust core.
/// Replace every stub body with the actual bridge call during integration.
final class DashboardBridge {
  const DashboardBridge();

  Future<Map<String, dynamic>> getFarmHealth() async {
    // TODO: rustCore.getFarmHealth()
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return <String, dynamic>{
      'score': 78.5,
      'status': 'good',
      'active_alerts': 2,
      'active_diseases': 1,
      'last_updated': DateTime.now().toIso8601String(),
      'recommendations': <String>[
        'Apply fungicide to maize field B.',
        'Irrigation recommended — soil moisture is low.',
        'Harvest window opens in 5 days.',
      ],
    };
  }

  Future<Map<String, dynamic>> getWeatherSummary() async {
    // TODO: rustCore.getWeatherSummary()
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return <String, dynamic>{
      'temperature': 24.0,
      'feels_like': 26.0,
      'condition': 'partlyCloudy',
      'humidity': 68,
      'wind_speed': 12.0,
      'rainfall': 0.0,
      'location': 'Harare, Zimbabwe',
      'is_offline_cached': false,
    };
  }

  Future<List<Map<String, dynamic>>> getAlerts() async {
    // TODO: rustCore.getAlerts()
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'alert_001',
        'title': 'Disease Detected',
        'message':
            'Gray Leaf Spot detected in Field A with 87% confidence.',
        'severity': 'high',
        'type': 'ai',
        'timestamp': DateTime.now()
            .subtract(const Duration(hours: 2))
            .toIso8601String(),
        'is_read': false,
      },
      <String, dynamic>{
        'id': 'alert_002',
        'title': 'Heavy Rain Expected',
        'message':
            'Heavy rainfall expected tomorrow. Consider postponing spraying.',
        'severity': 'medium',
        'type': 'weather',
        'timestamp': DateTime.now()
            .subtract(const Duration(hours: 5))
            .toIso8601String(),
        'is_read': false,
      },
      <String, dynamic>{
        'id': 'alert_003',
        'title': 'Market Price Alert',
        'message': 'Maize prices up 12% at Mbare Market today.',
        'severity': 'low',
        'type': 'market',
        'timestamp': DateTime.now()
            .subtract(const Duration(hours: 8))
            .toIso8601String(),
        'is_read': true,
      },
    ];
  }

  Future<List<Map<String, dynamic>>> getMarketPrices() async {
    // TODO: rustCore.getMarketPrices()
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return <Map<String, dynamic>>[
      <String, dynamic>{
        'crop_name': 'Maize',
        'price_per_unit': 485.0,
        'unit': 'per tonne',
        'market': 'Mbare',
        'price_change': 12.0,
        'last_updated': DateTime.now().toIso8601String(),
      },
      <String, dynamic>{
        'crop_name': 'Tobacco',
        'price_per_unit': 3.85,
        'unit': 'per kg',
        'market': 'Auction Floors',
        'price_change': -0.15,
        'last_updated': DateTime.now().toIso8601String(),
      },
      <String, dynamic>{
        'crop_name': 'Soya Beans',
        'price_per_unit': 620.0,
        'unit': 'per tonne',
        'market': 'Grain Market',
        'price_change': 5.0,
        'last_updated': DateTime.now().toIso8601String(),
      },
    ];
  }

  Future<Map<String, dynamic>> getSyncStatus() async {
    // TODO: rustCore.getSyncStatus()
    return <String, dynamic>{
      'is_online': true,
      'is_syncing': false,
      'pending_uploads': 3,
      'failed_items': 0,
      'queue_size': 3,
      'last_sync_time': DateTime.now()
          .subtract(const Duration(minutes: 15))
          .toIso8601String(),
    };
  }

  Stream<Map<String, dynamic>> watchSyncStatus() async* {
    // TODO: rustCore.watchSyncStatus()
    yield await getSyncStatus();
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 30));
      yield <String, dynamic>{
        'is_online': true,
        'is_syncing': false,
        'pending_uploads': 0,
        'failed_items': 0,
        'queue_size': 0,
        'last_sync_time': DateTime.now().toIso8601String(),
      };
    }
  }
}
