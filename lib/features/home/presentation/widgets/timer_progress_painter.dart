import 'dart:math' as math;
import 'package:flutter/material.dart';

class TimerProgressPainter extends CustomPainter {
  TimerProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColors,
    required this.glowColor,
  });

  final double progress;
  final Color backgroundColor;
  final List<Color> progressColors;
  final Color glowColor;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 4.0;

    final safeProgress = progress.clamp(0.0, 1.0);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..shader = LinearGradient(
        colors: progressColors,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final glowPaint = Paint()
      ..color = glowColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    canvas.drawCircle(center, radius, backgroundPaint);

    canvas.drawArc(
      rect,
      -math.pi / 2,
      safeProgress * 2 * math.pi,
      false,
      glowPaint,
    );

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
    return oldDelegate.progress != progress ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.glowColor != glowColor ||
        oldDelegate.progressColors != progressColors;
  }
}