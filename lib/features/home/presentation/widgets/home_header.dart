import 'package:flutter/material.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        SizedBox(width: 42, height: 42),
        const Spacer(),
        Text(
          'FOCUSZEN',
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            letterSpacing: 5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        HeaderIconButton(icon: Icons.tune_rounded, onTap: onSettingsTap),
      ],
    );
  }
}
