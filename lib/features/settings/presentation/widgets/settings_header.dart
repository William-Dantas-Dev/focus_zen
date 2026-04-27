import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 48),
        const Spacer(),
        Text(
          'FOCUSZEN',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            letterSpacing: 5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.primary,
          child: Icon(
            Icons.person_rounded,
            color: AppColors.tertiary,
            size: 18,
          ),
        ),
      ],
    );
  }
}
