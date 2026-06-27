import 'package:flutter/material.dart';

import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Data class for a single quick action button.
final class QuickAction {
  const QuickAction({
    required this.label,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onTap;
}

/// 4-column grid of quick action buttons.
class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key, required this.actions});

  final List<QuickAction> actions;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: AppSpacing.sm,
        crossAxisSpacing: AppSpacing.sm,
        childAspectRatio: 0.85,
      ),
      itemCount: actions.length,
      itemBuilder: (_, i) => _ActionItem(action: actions[i]),
    );
  }
}

class _ActionItem extends StatelessWidget {
  const _ActionItem({required this.action});
  final QuickAction action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSpacing.touchTarget,
            height: AppSpacing.touchTarget,
            decoration: BoxDecoration(
              color: action.backgroundColor,
              borderRadius: AppRadius.mediumAll,
            ),
            child: Icon(action.icon, color: action.color, size: 24),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            action.label,
            style: AppTypography.labelSmall.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
