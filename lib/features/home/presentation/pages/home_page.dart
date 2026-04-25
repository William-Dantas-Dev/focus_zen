import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double progress = 0.72;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.2,
            colors: [
              Color(0xFF162014),
              AppColors.darkBackground,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const SizedBox(height: 16),

                _Header(),

                const Spacer(),

                _ModeChip(),

                const SizedBox(height: 42),

                _TimerCircle(progress: progress),

                const SizedBox(height: 48),

                _Controls(),

                const Spacer(),

                _BottomNav(),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
        ),
        const Spacer(),
        Text(
          'FOCUSZEN',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.textPrimary,
                letterSpacing: 5,
                fontWeight: FontWeight.w600,
              ),
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.primary,
          child: Icon(
            Icons.person_rounded,
            color: AppColors.tertiary,
            size: 22,
          ),
        ),
      ],
    );
  }
}

class _ModeChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.7),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'FOCUS',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textSecondary,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class _TimerCircle extends StatelessWidget {
  const _TimerCircle({
    required this.progress,
  });

  final double progress;

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
          CustomPaint(
            size: const Size(260, 260),
            painter: _TimerProgressPainter(progress: progress),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '25:00',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 62,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -3,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'SESSION 1/4',
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

class _Controls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SmallControlButton(
          icon: Icons.refresh_rounded,
          onTap: () {},
        ),
        const SizedBox(width: 30),
        _PlayButton(onTap: () {}),
        const SizedBox(width: 30),
        _SmallControlButton(
          icon: Icons.skip_next_rounded,
          onTap: () {},
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF8AFF8A),
              Color(0xFF48C95A),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.45),
              blurRadius: 34,
              spreadRadius: 4,
            ),
          ],
        ),
        child: const Icon(
          Icons.play_arrow_rounded,
          color: AppColors.tertiary,
          size: 42,
        ),
      ),
    );
  }
}

class _SmallControlButton extends StatelessWidget {
  const _SmallControlButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon),
      color: AppColors.textSecondary,
      iconSize: 28,
    );
  }
}

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _BottomNavItem(
            icon: Icons.timer_rounded,
            isActive: true,
          ),
          _BottomNavItem(
            icon: Icons.bar_chart_rounded,
            isActive: false,
          ),
          _BottomNavItem(
            icon: Icons.settings_rounded,
            isActive: false,
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.isActive,
  });

  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? AppColors.primary.withValues(alpha: 0.16)
            : Colors.transparent,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                ),
              ]
            : null,
      ),
      child: Icon(
        icon,
        size: 22,
        color: isActive ? AppColors.primary : AppColors.textMuted,
      ),
    );
  }
}

class _TimerProgressPainter extends CustomPainter {
  _TimerProgressPainter({
    required this.progress,
  });

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 4.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF8AFF8A),
          Color(0xFF42C85A),
        ],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708,
      progress * 6.28318,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _TimerProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}