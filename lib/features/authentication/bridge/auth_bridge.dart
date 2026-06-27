/// AgriLink Edge — Authentication Rust Bridge Stub
///
/// All methods route through flutter_rust_bridge to the Rust core.
/// Flutter never performs authentication logic directly.
/// Replace every stub body with the actual bridge call during Rust integration.
final class AuthBridge {
  const AuthBridge();

  Future<({String? error})> sendOtp({
    required String phoneNumber,
    required String countryCode,
  }) async {
    // TODO: rustCore.sendOtp(phone: phoneNumber, country: countryCode)
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return (error: null);
  }

  Future<({Map<String, dynamic>? userData, String? error})> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    // TODO: rustCore.verifyOtp(phone: phoneNumber, otp: otp)
    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (otp.length == 6) {
      return (
        userData: <String, dynamic>{
          'id': 'usr_${DateTime.now().millisecondsSinceEpoch}',
          'phone_number': phoneNumber,
          'role': 'farmer',
          'is_onboarding_complete': false,
          'preferred_locale': 'en',
        },
        error: null,
      );
    }
    return (userData: null, error: 'Invalid OTP. Please try again.');
  }

  Future<({Map<String, dynamic>? farmerData, String? error})> registerFarmer({
    required Map<String, dynamic> farmerData,
  }) async {
    // TODO: rustCore.registerFarmer(data: farmerData)
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return (farmerData: farmerData, error: null);
  }

  Future<Map<String, dynamic>?> getStoredSession() async {
    // TODO: rustCore.getStoredSession()
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return null;
  }

  Future<void> clearSession() async {
    // TODO: rustCore.clearSession()
    await Future<void>.delayed(const Duration(milliseconds: 100));
  }

  Future<bool> checkBiometricAvailable() async {
    // TODO: rustCore.isBiometricAvailable()
    return false;
  }

  Future<({Map<String, dynamic>? userData, String? error})>
      authenticateWithBiometrics() async {
    // TODO: rustCore.authenticateWithBiometrics()
    return (
      userData: null,
      error: 'Biometric authentication not yet available.',
    );
  }

  Future<({bool success, String? error})> initializeKernel() async {
    // TODO: rustCore.initialize()
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return (success: true, error: null);
  }
}
