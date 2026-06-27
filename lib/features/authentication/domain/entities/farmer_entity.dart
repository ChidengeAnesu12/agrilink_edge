import 'package:equatable/equatable.dart';

/// Immutable domain entity representing a farmer's profile.
final class FarmerEntity extends Equatable {
  const FarmerEntity({
    required this.userId,
    required this.fullName,
    required this.province,
    required this.district,
    required this.ward,
    required this.farmType,
    required this.experienceYears,
    required this.preferredLanguage,
    this.avatarPath,
    this.phoneNumber,
  });

  final String userId;
  final String fullName;
  final String province;
  final String district;
  final String ward;
  final String farmType;
  final int experienceYears;
  final String preferredLanguage;
  final String? avatarPath;
  final String? phoneNumber;

  @override
  List<Object?> get props => [
        userId,
        fullName,
        province,
        district,
        ward,
        farmType,
        experienceYears,
        preferredLanguage,
        avatarPath,
        phoneNumber,
      ];
}
