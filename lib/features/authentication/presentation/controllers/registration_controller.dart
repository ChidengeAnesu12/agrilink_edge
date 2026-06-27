import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_error.dart';
import '../../domain/entities/farmer_entity.dart';
import '../providers/auth_providers.dart';

final class FarmerFormState {
  const FarmerFormState({
    this.fullName = '',
    this.province = '',
    this.district = '',
    this.ward = '',
    this.farmType = '',
    this.experienceYears = 0,
    this.preferredLanguage = 'en',
    this.avatarPath,
  });

  final String fullName;
  final String province;
  final String district;
  final String ward;
  final String farmType;
  final int experienceYears;
  final String preferredLanguage;
  final String? avatarPath;

  bool get isValid =>
      fullName.trim().isNotEmpty &&
      province.isNotEmpty &&
      district.isNotEmpty &&
      farmType.isNotEmpty;

  FarmerFormState copyWith({
    String? fullName,
    String? province,
    String? district,
    String? ward,
    String? farmType,
    int? experienceYears,
    String? preferredLanguage,
    String? avatarPath,
  }) =>
      FarmerFormState(
        fullName: fullName ?? this.fullName,
        province: province ?? this.province,
        district: district ?? this.district,
        ward: ward ?? this.ward,
        farmType: farmType ?? this.farmType,
        experienceYears: experienceYears ?? this.experienceYears,
        preferredLanguage: preferredLanguage ?? this.preferredLanguage,
        avatarPath: avatarPath ?? this.avatarPath,
      );
}

sealed class RegistrationState {
  const RegistrationState();
}

final class RegistrationInitial extends RegistrationState {
  const RegistrationInitial();
}

final class RegistrationLoading extends RegistrationState {
  const RegistrationLoading();
}

final class RegistrationSuccess extends RegistrationState {
  const RegistrationSuccess({required this.farmer});
  final FarmerEntity farmer;
}

final class RegistrationError extends RegistrationState {
  const RegistrationError({required this.error});
  final AppError error;
}

class RegistrationController extends Notifier<RegistrationState> {
  var _form = const FarmerFormState();

  @override
  RegistrationState build() => const RegistrationInitial();

  FarmerFormState get formState => _form;

  void updateFullName(String value) => _form = _form.copyWith(fullName: value);
  void updateProvince(String value) =>
      _form = _form.copyWith(province: value, district: '');
  void updateDistrict(String value) =>
      _form = _form.copyWith(district: value);
  void updateWard(String value) => _form = _form.copyWith(ward: value);
  void updateFarmType(String value) =>
      _form = _form.copyWith(farmType: value);
  void updateExperience(int years) =>
      _form = _form.copyWith(experienceYears: years);
  void updateLanguage(String locale) =>
      _form = _form.copyWith(preferredLanguage: locale);

  Future<void> submit({required String userId}) async {
    if (!_form.isValid) {
      state = const RegistrationError(
        error: ValidationError(
          message: 'Please complete all required fields.',
          field: 'form',
        ),
      );
      return;
    }

    state = const RegistrationLoading();

    final entity = FarmerEntity(
      userId: userId,
      fullName: _form.fullName.trim(),
      province: _form.province,
      district: _form.district,
      ward: _form.ward,
      farmType: _form.farmType,
      experienceYears: _form.experienceYears,
      preferredLanguage: _form.preferredLanguage,
      avatarPath: _form.avatarPath,
    );

    final result = await ref
        .read(registerFarmerUseCaseProvider)(farmer: entity);

    if (result.error != null) {
      state = RegistrationError(error: result.error!);
      return;
    }

    state = RegistrationSuccess(farmer: result.farmer!);
  }
}

final registrationControllerProvider =
    NotifierProvider<RegistrationController, RegistrationState>(
  RegistrationController.new,
);
