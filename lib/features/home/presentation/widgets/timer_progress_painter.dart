import 'dart:math' as math;
import 'package:flutter/material.dart';

class TimerProgressPainter extends CustomPainter {
  TimerProgressPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 4.0;

    final safeProgress = progress.clamp(0.0, 1.0);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final rect = Rect.fromCircle(center: center, radius: radius);

    final backgroundPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF8AFF8A), Color(0xFF42C85A)],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final glowPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF8AFF8A), Color(0xFF42C85A)],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    // Background
    canvas.drawCircle(center, radius, backgroundPaint);

    // Glow (por trás)
    canvas.drawArc(
      rect,
      -math.pi / 2,
      safeProgress * 2 * math.pi,
      false,
      glowPaint,
    );

    // Progress
    canvas.drawArc(
      rect,
      -math.pi / 2,
      safeProgress * 2 * math.pi,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant TimerProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
