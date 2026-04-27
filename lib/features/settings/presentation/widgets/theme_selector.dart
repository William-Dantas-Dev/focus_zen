import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({
    super.key,
    required this.selectedTheme,
    required this.onChanged,
  });

  final String selectedTheme;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final options = ['Light', 'Dark', 'System'];

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.045),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: Row(
        children: options.map((option) {
          final isSelected = selectedTheme == option;

          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(option),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withValues(alpha: 0.18)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.25),
                            blurRadius: 18,
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  option,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:
                            isSelected ? AppColors.primary : AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}