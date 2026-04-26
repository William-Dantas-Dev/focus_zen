import 'package:flutter/material.dart';

import 'play_button.dart';
import 'small_control_button.dart';

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.isRunning,
    required this.onPlay,
    required this.onReset,
    required this.onSkip,
  });

  final bool isRunning;
  final VoidCallback onPlay;
  final VoidCallback onReset;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmallControlButton(icon: Icons.refresh_rounded, onTap: onReset),
        const SizedBox(width: 30),
        PlayButton(isRunning: isRunning, onTap: onPlay),
        const SizedBox(width: 30),
        SmallControlButton(icon: Icons.skip_next_rounded, onTap: onSkip),
      ],
    );
  }
}
