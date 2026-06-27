import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_error.dart';

final class FarmWizardFormState {
  const FarmWizardFormState({
    this.farmName = '',
    this.latitude,
    this.longitude,
    this.cropType = '',
    this.areaHectares = 0.5,
    this.soilType = '',
    this.waterSource = '',
    this.currentStep = 0,
  });

  final String farmName;
  final double? latitude;
  final double? longitude;
  final String cropType;
  final double areaHectares;
  final String soilType;
  final String waterSource;
  final int currentStep;

  static const int totalSteps = 5;

  bool get isLastStep => currentStep == totalSteps - 1;
  bool get isFirstStep => currentStep == 0;

  bool get currentStepValid {
    switch (currentStep) {
      case 0:
        return farmName.trim().isNotEmpty;
      case 1:
        return true;
      case 2:
        return cropType.isNotEmpty;
      case 3:
        return areaHectares > 0;
      case 4:
        return true;
      default:
        return false;
    }
  }

  FarmWizardFormState copyWith({
    String? farmName,
    double? latitude,
    double? longitude,
    String? cropType,
    double? areaHectares,
    String? soilType,
    String? waterSource,
    int? currentStep,
  }) =>
      FarmWizardFormState(
        farmName: farmName ?? this.farmName,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        cropType: cropType ?? this.cropType,
        areaHectares: areaHectares ?? this.areaHectares,
        soilType: soilType ?? this.soilType,
        waterSource: waterSource ?? this.waterSource,
        currentStep: currentStep ?? this.currentStep,
      );
}

sealed class FarmWizardState {
  const FarmWizardState();
}

final class FarmWizardActive extends FarmWizardState {
  const FarmWizardActive({required this.form});
  final FarmWizardFormState form;
}

final class FarmWizardLoading extends FarmWizardState {
  const FarmWizardLoading();
}

final class FarmWizardComplete extends FarmWizardState {
  const FarmWizardComplete();
}

final class FarmWizardError extends FarmWizardState {
  const FarmWizardError({required this.error});
  final AppError error;
}

class FarmWizardController extends Notifier<FarmWizardState> {
  @override
  FarmWizardState build() =>
      const FarmWizardActive(form: FarmWizardFormState());

  FarmWizardFormState? get _form =>
      state is FarmWizardActive
          ? (state as FarmWizardActive).form
          : null;

  void _update(FarmWizardFormState f) => state = FarmWizardActive(form: f);

  void updateFarmName(String v) {
    final f = _form;
    if (f != null) _update(f.copyWith(farmName: v));
  }

  void updateLocation(double lat, double lng) {
    final f = _form;
    if (f != null) _update(f.copyWith(latitude: lat, longitude: lng));
  }

  void updateCropType(String v) {
    final f = _form;
    if (f != null) _update(f.copyWith(cropType: v));
  }

  void updateArea(double hectares) {
    final f = _form;
    if (f != null) _update(f.copyWith(areaHectares: hectares));
  }

  void updateSoilType(String v) {
    final f = _form;
    if (f != null) _update(f.copyWith(soilType: v));
  }

  void nextStep() {
    final f = _form;
    if (f == null || !f.currentStepValid || f.isLastStep) return;
    _update(f.copyWith(currentStep: f.currentStep + 1));
  }

  void previousStep() {
    final f = _form;
    if (f == null || f.isFirstStep) return;
    _update(f.copyWith(currentStep: f.currentStep - 1));
  }

  Future<void> complete({required String userId}) async {
    state = const FarmWizardLoading();
    // TODO: Call FarmBridge to persist farm data
    await Future<void>.delayed(const Duration(seconds: 1));
    state = const FarmWizardComplete();
  }

  void skipWizard() => state = const FarmWizardComplete();
}

final farmWizardControllerProvider =
    NotifierProvider<FarmWizardController, FarmWizardState>(
  FarmWizardController.new,
);
