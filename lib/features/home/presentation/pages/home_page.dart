import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/timer_controller.dart';
import '../../data/models/timer_preset_option.dart';
import '../widgets/controls.dart';
import '../widgets/home_header.dart';
import '../widgets/mode_chip.dart';
import '../widgets/timer_circle.dart';
import '../widgets/timer_preset_bottom_sheet.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  void _openPresetBottomSheet(TimerPresetOption selectedPreset) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return TimerPresetBottomSheet(
          selectedPreset: selectedPreset,
          onPresetSelected: (preset) {
            ref.read(timerControllerProvider.notifier).selectPreset(preset);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(timerControllerProvider);
    final controller = ref.read(timerControllerProvider.notifier);

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 1.2,
          colors: [
            colorScheme.surface,
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 16),

              HomeHeader(
                onMenuTap: () {},
                onSettingsTap: () =>
                    _openPresetBottomSheet(timer.selectedPreset),
              ),

              const Spacer(),

              ModeChip(mode: timer.mode),

              const SizedBox(height: 42),

              TimerCircle(
                progress: timer.progress,
                time: timer.formattedTime,
                sessionText: timer.sessionText,
              ),

              const SizedBox(height: 48),

              Controls(
                isRunning: timer.isRunning,
                onPlay: controller.toggle,
                onReset: controller.reset,
                onSkip: controller.skip,
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
