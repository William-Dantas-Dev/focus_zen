import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class SettingsSectionLabel extends StatelessWidget {
  const SettingsSectionLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.textMuted,
            letterSpacing: 2.4,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}