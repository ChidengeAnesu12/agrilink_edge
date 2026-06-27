import '../../domain/entities/user_entity.dart';

/// Data-layer representation of [UserEntity].
/// Converts between raw bridge Map data and the domain entity.
final class UserModel {
  const UserModel({
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

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'] as String,
        phoneNumber: map['phone_number'] as String,
        role: map['role'] as String? ?? 'farmer',
        isOnboardingComplete:
            map['is_onboarding_complete'] as bool? ?? false,
        email: map['email'] as String?,
        displayName: map['display_name'] as String?,
        avatarUrl: map['avatar_url'] as String?,
        preferredLocale: map['preferred_locale'] as String? ?? 'en',
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'phone_number': phoneNumber,
        'role': role,
        'is_onboarding_complete': isOnboardingComplete,
        'email': email,
        'display_name': displayName,
        'avatar_url': avatarUrl,
        'preferred_locale': preferredLocale,
      };

  UserEntity toEntity() => UserEntity(
        id: id,
        phoneNumber: phoneNumber,
        role: role,
        isOnboardingComplete: isOnboardingComplete,
        email: email,
        displayName: displayName,
        avatarUrl: avatarUrl,
        preferredLocale: preferredLocale,
      );
}
