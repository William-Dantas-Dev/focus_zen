import 'package:flutter/material.dart';

import 'timer_progress_painter.dart';

class TimerCircle extends StatelessWidget {
  const TimerCircle({
    super.key,
    required this.progress,
    required this.time,
    required this.sessionText,
  });

  final double progress;
  final String time;
  final String sessionText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: 260,
      height: 260,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? colorScheme.surface.withValues(alpha: 0.45)
                  : colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.22),
                  blurRadius: 54,
                  spreadRadius: 8,
                ),
              ],
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(milliseconds: 950),
            curve: Curves.linear,
            builder: (context, animatedProgress, child) {
              return CustomPaint(
                size: const Size(250, 250),
                painter: TimerProgressPainter(
                  progress: animatedProgress,
                  backgroundColor: colorScheme.onSurface.withValues(
                    alpha: 0.08,
                  ),
                  progressColors: [
                    colorScheme.primary,
                    colorScheme.primary.withValues(alpha: 0.65),
                  ],
                  glowColor: colorScheme.primary.withValues(alpha: 0.35),
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: textTheme.displayLarge?.copyWith(
                  fontSize: 62,
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -3,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                sessionText,
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                  letterSpacing: 4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
