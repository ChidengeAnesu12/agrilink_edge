import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Phone number input with a country code picker bottom sheet.
class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    super.key,
    required this.onChanged,
    this.controller,
    this.selectedCountryCode = '+263',
    this.onCountryCodeChanged,
    this.errorText,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final void Function(String) onChanged;
  final String selectedCountryCode;
  final void Function(String)? onCountryCodeChanged;
  final String? errorText;
  final bool enabled;

  static const List<_Country> _countries = [
    _Country(flag: '🇿🇼', name: 'Zimbabwe', code: '+263'),
    _Country(flag: '🇿🇦', name: 'South Africa', code: '+27'),
    _Country(flag: '🇿🇲', name: 'Zambia', code: '+260'),
    _Country(flag: '🇧🇼', name: 'Botswana', code: '+267'),
    _Country(flag: '🇲🇿', name: 'Mozambique', code: '+258'),
    _Country(flag: '🇳🇦', name: 'Namibia', code: '+264'),
    _Country(flag: '🇰🇪', name: 'Kenya', code: '+254'),
    _Country(flag: '🇳🇬', name: 'Nigeria', code: '+234'),
    _Country(flag: '🇬🇧', name: 'United Kingdom', code: '+44'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CountryButton(
          selected: selectedCountryCode,
          countries: _countries,
          onSelected: onCountryCodeChanged,
          errorText: errorText,
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: TextField(
            controller: controller,
            enabled: enabled,
            keyboardType: TextInputType.phone,
            style: AppTypography.bodyLarge,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(12),
            ],
            decoration: InputDecoration(
              hintText: 'Phone number',
              errorText: errorText,
              prefixIcon: const Icon(
                Icons.phone_rounded,
                color: AppColors.primary,
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class _CountryButton extends StatelessWidget {
  const _CountryButton({
    required this.selected,
    required this.countries,
    this.onSelected,
    this.errorText,
  });

  final String selected;
  final List<_Country> countries;
  final void Function(String)? onSelected;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final _Country current = countries.firstWhere(
      (c) => c.code == selected,
      orElse: () => countries.first,
    );

    return GestureDetector(
      onTap: () => _showSheet(context),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        decoration: BoxDecoration(
          border: Border.all(
            color: errorText != null
                ? AppColors.error
                : AppColors.borderLight,
          ),
          borderRadius: AppRadius.mediumAll,
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(current.flag, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: AppSpacing.xs),
            Text(current.code, style: AppTypography.bodyLarge),
            const Icon(Icons.arrow_drop_down_rounded, size: 20),
          ],
        ),
      ),
    );
  }

  void _showSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => ListView.builder(
        itemCount: countries.length,
        itemBuilder: (ctx, i) {
          final c = countries[i];
          return ListTile(
            leading: Text(c.flag, style: const TextStyle(fontSize: 24)),
            title: Text(c.name),
            trailing: Text(c.code, style: AppTypography.bodySmall),
            selected: c.code == selected,
            selectedColor: AppColors.primary,
            onTap: () {
              onSelected?.call(c.code);
              Navigator.of(ctx).pop();
            },
          );
        },
      ),
    );
  }
}

final class _Country {
  const _Country({
    required this.flag,
    required this.name,
    required this.code,
  });

  final String flag;
  final String name;
  final String code;
}
