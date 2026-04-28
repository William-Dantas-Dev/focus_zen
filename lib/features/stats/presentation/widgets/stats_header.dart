import 'package:flutter/material.dart';

class StatsHeader extends StatelessWidget {
  const StatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          Icons.menu_rounded,
          color: colorScheme.onSurface.withValues(alpha: 0.65),
        ),
        const SizedBox(width: 16),
        Text(
          'Focus Zen',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w800,
              ),
        ),
        const Spacer(),
        CircleAvatar(
          radius: 16,
          backgroundColor: colorScheme.primary,
          child: Icon(
            Icons.person_rounded,
            size: 18,
            color: colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}