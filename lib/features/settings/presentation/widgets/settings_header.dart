import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        const SizedBox(width: 48),

        const Spacer(),

        Text(
          'FOCUSZEN',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            letterSpacing: 5,
            fontWeight: FontWeight.w600,
          ),
        ),

        const Spacer(),

        CircleAvatar(
          radius: 16,
          backgroundColor: colorScheme.primary,
          child: Icon(
            Icons.person_rounded,
            color: colorScheme.onPrimary,
            size: 18,
          ),
        ),
      ],
    );
  }
}
