import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../routes/app_router.dart';
import '../controllers/registration_controller.dart';
import '../widgets/auth_header_widget.dart';

/// SCREEN 007 — Farmer Registration
class FarmerRegistrationPage extends ConsumerWidget {
  const FarmerRegistrationPage({
    super.key,
    required this.userId,
  });

  final String userId;

  static const List<String> _provinces = [
    'Harare',
    'Bulawayo',
    'Manicaland',
    'Mashonaland Central',
    'Mashonaland East',
    'Mashonaland West',
    'Masvingo',
    'Matabeleland North',
    'Matabeleland South',
    'Midlands',
  ];

  static const List<String> _farmTypes = [
    'Crop Farming',
    'Livestock',
    'Mixed Farming',
    'Horticulture',
    'Poultry',
    'Dairy',
    'Aquaculture',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = ref.read(registrationControllerProvider.notifier);

    ref.listen<RegistrationState>(registrationControllerProvider, (_, next) {
      if (next is RegistrationSuccess) {
        context.goNamed(
          AppRoutes.farmWizard,
          queryParameters: {'userId': userId},
        );
      }
    });

    final state = ref.watch(registrationControllerProvider);
    final bool isLoading = state is RegistrationLoading;
    final String? errorMsg =
        state is RegistrationError ? state.error.message : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPaddingMobile,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.lg),
              const AuthHeaderWidget(
                title: 'Tell us about yourself',
                subtitle:
                    'Your profile helps us personalise AI advice for your farm.',
                iconData: Icons.agriculture_rounded,
              ),
              const SizedBox(height: AppSpacing.xxl),
              TextField(
                enabled: !isLoading,
                decoration: const InputDecoration(
                  labelText: 'Full Name *',
                  hintText: 'Enter your full name',
                  prefixIcon: Icon(
                    Icons.person_rounded,
                    color: AppColors.primary,
                  ),
                ),
                onChanged: ctrl.updateFullName,
              ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Province *',
                  prefixIcon: Icon(
                    Icons.location_on_rounded,
                    color: AppColors.primary,
                  ),
                ),
                items: _provinces
                    .map(
                      (p) => DropdownMenuItem(value: p, child: Text(p)),
                    )
                    .toList(),
                onChanged: isLoading ? null : (v) => ctrl.updateProvince(v!),
              ),
              const SizedBox(height: AppSpacing.md),
              TextField(
                enabled: !isLoading,
                decoration: const InputDecoration(
                  labelText: 'District *',
                  hintText: 'Enter your district',
                  prefixIcon: Icon(
                    Icons.map_rounded,
                    color: AppColors.primary,
                  ),
                ),
                onChanged: ctrl.updateDistrict,
              ),
              const SizedBox(height: AppSpacing.md),
              TextField(
                enabled: !isLoading,
                decoration: const InputDecoration(
                  labelText: 'Ward (Optional)',
                  hintText: 'Enter your ward',
                ),
                onChanged: ctrl.updateWard,
              ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Farm Type *',
                  prefixIcon: Icon(
                    Icons.agriculture_rounded,
                    color: AppColors.primary,
                  ),
                ),
                items: _farmTypes
                    .map(
                      (t) => DropdownMenuItem(value: t, child: Text(t)),
                    )
                    .toList(),
                onChanged: isLoading ? null : (v) => ctrl.updateFarmType(v!),
              ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Preferred Language *',
                  prefixIcon: Icon(
                    Icons.language_rounded,
                    color: AppColors.primary,
                  ),
                ),
                initialValue: 'en',
                items: const [
                  DropdownMenuItem(value: 'en', child: Text('English')),
                  DropdownMenuItem(value: 'sn', child: Text('Shona')),
                  DropdownMenuItem(value: 'nd', child: Text('Ndebele')),
                ],
                onChanged:
                    isLoading ? null : (v) => ctrl.updateLanguage(v!),
              ),
              if (errorMsg != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  errorMsg,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.xxl),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchTarget,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () => ctrl.submit(userId: userId),
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.onPrimary,
                          ),
                        )
                      : const Text('Continue'),
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
