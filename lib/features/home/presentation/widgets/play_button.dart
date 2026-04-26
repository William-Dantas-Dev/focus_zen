import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key, required this.onTap, required this.isRunning});

  final VoidCallback onTap;
  final bool isRunning;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        splashColor: AppColors.primary.withValues(alpha: 0.2),
        highlightColor: AppColors.primary.withValues(alpha: 0.1),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF8AFF8A), Color(0xFF48C95A)],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.45),
                blurRadius: 34,
                spreadRadius: 4,
              ),
            ],
          ),
          child: Icon(
            isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: AppColors.tertiary,
            size: 42,
          ),
        ),
      ),
    );
  }
}
