import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
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
              color: AppColors.darkSurface.withValues(alpha: 0.45),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.22),
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
                size: const Size(260, 260),
                painter: TimerProgressPainter(progress: progress),
              );
            },
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 62,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -3,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                sessionText,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textMuted,
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
