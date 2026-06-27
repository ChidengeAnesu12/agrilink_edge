import '../../domain/entities/farmer_entity.dart';

/// Data-layer representation of [FarmerEntity].
final class FarmerModel {
  const FarmerModel({
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

  factory FarmerModel.fromEntity(FarmerEntity entity) => FarmerModel(
        userId: entity.userId,
        fullName: entity.fullName,
        province: entity.province,
        district: entity.district,
        ward: entity.ward,
        farmType: entity.farmType,
        experienceYears: entity.experienceYears,
        preferredLanguage: entity.preferredLanguage,
        avatarPath: entity.avatarPath,
        phoneNumber: entity.phoneNumber,
      );

  factory FarmerModel.fromMap(Map<String, dynamic> map) => FarmerModel(
        userId: map['user_id'] as String,
        fullName: map['full_name'] as String,
        province: map['province'] as String,
        district: map['district'] as String,
        ward: map['ward'] as String? ?? '',
        farmType: map['farm_type'] as String,
        experienceYears: map['experience_years'] as int? ?? 0,
        preferredLanguage:
            map['preferred_language'] as String? ?? 'en',
        avatarPath: map['avatar_path'] as String?,
        phoneNumber: map['phone_number'] as String?,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'user_id': userId,
        'full_name': fullName,
        'province': province,
        'district': district,
        'ward': ward,
        'farm_type': farmType,
        'experience_years': experienceYears,
        'preferred_language': preferredLanguage,
        'avatar_path': avatarPath,
        'phone_number': phoneNumber,
      };

  FarmerEntity toEntity() => FarmerEntity(
        userId: userId,
        fullName: fullName,
        province: province,
        district: district,
        ward: ward,
        farmType: farmType,
        experienceYears: experienceYears,
        preferredLanguage: preferredLanguage,
        avatarPath: avatarPath,
        phoneNumber: phoneNumber,
      );
}
