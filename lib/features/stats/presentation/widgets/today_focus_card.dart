import 'package:flutter/material.dart';

class TodayFocusCard extends StatelessWidget {
  const TodayFocusCard({
    super.key,
    required this.focusTime,
    required this.sessionsCompleted,
  });

  final String focusTime;
  final int sessionsCompleted;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.black.withValues(alpha: 0.035),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.onSurface.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        children: [
          Text(
            "TODAY'S FOCUS",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            focusTime,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w800,
              shadows: [
                Shadow(
                  color: colorScheme.primary.withValues(alpha: 0.4),
                  blurRadius: 18,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.flash_on_rounded,
                size: 18,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                '$sessionsCompleted Sessions Completed',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
