import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'header_icon_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.onMenuTap,
    required this.onSettingsTap,
  });

  final VoidCallback onMenuTap;
  final VoidCallback onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Menu
        HeaderIconButton(icon: Icons.menu_rounded, onTap: onMenuTap),

        const Spacer(),

        // Title
        Text(
          'FOCUSZEN',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            letterSpacing: 5,
            fontWeight: FontWeight.w600,
          ),
        ),

        const Spacer(),

        // Settings (troca de preset / configurações)
        HeaderIconButton(icon: Icons.tune_rounded, onTap: onSettingsTap),
      ],
    );
  }
}
