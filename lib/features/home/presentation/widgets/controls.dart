import 'package:flutter/material.dart';

import 'play_button.dart';
import 'small_control_button.dart';

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.onPlay,
    required this.onReset,
    required this.onSkip,
  });

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
        PlayButton(isRunning: true, onTap: () {}),
        const SizedBox(width: 30),
        SmallControlButton(icon: Icons.skip_next_rounded, onTap: onSkip),
      ],
    );
  }
}
