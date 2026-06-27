import 'package:equatable/equatable.dart';

/// Immutable domain entity representing an authenticated user.
final class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.phoneNumber,
    required this.role,
    required this.isOnboardingComplete,
    this.email,
    this.displayName,
    this.avatarUrl,
    this.preferredLocale = 'en',
  });

  final String id;
  final String phoneNumber;
  final String role;
  final bool isOnboardingComplete;
  final String? email;
  final String? displayName;
  final String? avatarUrl;
  final String preferredLocale;

  bool get isFarmer => role == 'farmer';
  bool get isExtensionOfficer => role == 'extension_officer';
  bool get isGovernment => role == 'government';
  bool get isGuest => role == 'guest';

  @override
  List<Object?> get props => [
        id,
        phoneNumber,
        role,
        isOnboardingComplete,
        email,
        displayName,
        avatarUrl,
        preferredLocale,
      ];
}
