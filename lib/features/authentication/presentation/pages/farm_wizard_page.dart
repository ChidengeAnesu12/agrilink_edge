import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../routes/app_router.dart';
import '../controllers/farm_wizard_controller.dart';
import '../widgets/wizard_step_indicator.dart';

/// SCREEN 008 — Farm Setup Wizard
class FarmWizardPage extends ConsumerWidget {
  const FarmWizardPage({super.key, required this.userId});

  final String userId;

  static const List<String> _stepLabels = [
    'Farm Name',
    'Location',
    'Crop',
    'Area',
    'Summary',
  ];

  static const List<String> _cropTypes = [
    'Maize',
    'Tobacco',
    'Cotton',
    'Soya Beans',
    'Wheat',
    'Groundnuts',
    'Sunflower',
    'Sorghum',
    'Vegetables',
    'Fruits',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = ref.read(farmWizardControllerProvider.notifier);

    ref.listen<FarmWizardState>(farmWizardControllerProvider, (_, next) {
      if (next is FarmWizardComplete) {
        context.goNamed(AppRoutes.dashboard);
      }
    });

    final state = ref.watch(farmWizardControllerProvider);

    if (state is FarmWizardLoading || state is FarmWizardComplete) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final form = state is FarmWizardActive
        ? state.form
        : const FarmWizardFormState();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Your Farm'),
        leading: form.isFirstStep
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: ctrl.previousStep,
              ),
        actions: [
          TextButton(
            onPressed: ctrl.skipWizard,
            child: const Text('Skip'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPaddingMobile,
          ),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.lg),
              WizardStepIndicator(
                currentStep: form.currentStep,
                totalSteps: FarmWizardFormState.totalSteps,
                stepLabels: _stepLabels,
              ),
              const SizedBox(height: AppSpacing.xxl),
              Expanded(
                child: _buildStep(form, ctrl, context),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
                child: SizedBox(
                  width: double.infinity,
                  height: AppSpacing.touchTarget,
                  child: ElevatedButton(
                    onPressed: form.currentStepValid
                        ? () {
                            if (form.isLastStep) {
                              ctrl.complete(userId: userId);
                            } else {
                              ctrl.nextStep();
                            }
                          }
                        : null,
                    child: Text(
                      form.isLastStep ? 'Create Farm' : 'Next',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(
    FarmWizardFormState form,
    FarmWizardController ctrl,
    BuildContext context,
  ) {
    switch (form.currentStep) {
      case 0:
        return _FarmNameStep(onChanged: ctrl.updateFarmName);
      case 1:
        return _LocationStep(
          onUseGps: () => ctrl.updateLocation(-20.1500, 28.5833),
        );
      case 2:
        return _CropStep(
          cropTypes: _cropTypes,
          selected: form.cropType,
          onSelected: ctrl.updateCropType,
        );
      case 3:
        return _AreaStep(
          area: form.areaHectares,
          onChanged: ctrl.updateArea,
        );
      case 4:
        return _SummaryStep(form: form);
      default:
        return const SizedBox.shrink();
    }
  }
}

class _FarmNameStep extends StatelessWidget {
  const _FarmNameStep({required this.onChanged});
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name your farm',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Give your farm a name you will recognise easily.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.xl),
        TextField(
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Farm Name *',
            hintText: 'e.g. Chidemge Family Farm',
            prefixIcon: Icon(
              Icons.agriculture_rounded,
              color: AppColors.primary,
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _LocationStep extends StatelessWidget {
  const _LocationStep({required this.onUseGps});
  final VoidCallback onUseGps;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Set farm location',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Your location is used for weather and disease alerts.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.xl),
        SizedBox(
          width: double.infinity,
          height: AppSpacing.touchTarget,
          child: ElevatedButton.icon(
            onPressed: onUseGps,
            icon: const Icon(Icons.gps_fixed_rounded),
            label: const Text('Use GPS Location'),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: const BoxDecoration(
            color: AppColors.infoContainer,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.info_rounded,
                color: AppColors.info,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'GPS works offline. Your location never leaves your device.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CropStep extends StatelessWidget {
  const _CropStep({
    required this.cropTypes,
    required this.selected,
    required this.onSelected,
  });

  final List<String> cropTypes;
  final String selected;
  final void Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Primary crop',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Select the crop you grow most.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.xl),
        Expanded(
          child: GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
            ),
            itemCount: cropTypes.length,
            itemBuilder: (_, i) {
              final bool isSelected = cropTypes[i] == selected;
              return GestureDetector(
                onTap: () => onSelected(cropTypes[i]),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.primaryContainer,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.borderLight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      cropTypes[i],
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(
                            color: isSelected
                                ? AppColors.onPrimary
                                : AppColors.primary,
                          ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AreaStep extends StatelessWidget {
  const _AreaStep({required this.area, required this.onChanged});

  final double area;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Farm area',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Approximate area in hectares.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.xxl),
        Center(
          child: Text(
            '${area.toStringAsFixed(1)} ha',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.primary,
                ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Slider(
          value: area.clamp(0.5, 500.0),
          min: 0.5,
          max: 500.0,
          divisions: 999,
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0.5 ha',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '500 ha',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class _SummaryStep extends StatelessWidget {
  const _SummaryStep({required this.form});
  final FarmWizardFormState form;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review your farm',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Everything looks correct? Tap Create Farm to continue.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.xl),
        _SummaryRow(label: 'Farm Name', value: form.farmName),
        _SummaryRow(
          label: 'Location',
          value: form.latitude != null
              ? '${form.latitude!.toStringAsFixed(4)}, ${form.longitude!.toStringAsFixed(4)}'
              : 'Not set',
        ),
        _SummaryRow(
          label: 'Primary Crop',
          value: form.cropType.isEmpty ? 'Not set' : form.cropType,
        ),
        _SummaryRow(
          label: 'Area',
          value: '${form.areaHectares.toStringAsFixed(1)} ha',
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.onSurfaceMediumLight,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
