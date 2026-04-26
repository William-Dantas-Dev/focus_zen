import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/controls.dart';
import '../widgets/home_header.dart';
import '../widgets/mode_chip.dart';
import '../widgets/timer_circle.dart';
import '../widgets/timer_preset_bottom_sheet.dart';
import '../widgets/timer_preset_option.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double progress = 0.72;
  int currentIndex = 0;

  late TimerPresetOption selectedPreset;
  late String time;
  late String sessionText;

  PomodoroMode mode = PomodoroMode.focus;

  @override
  void initState() {
    super.initState();

    selectedPreset = timerPresetOptions.first;
    time = _formatMinutes(selectedPreset.focusMinutes);
    sessionText = 'SESSION 1/${selectedPreset.cycles}';
  }

  String _formatMinutes(int minutes) {
    return '${minutes.toString().padLeft(2, '0')}:00';
  }

  void _selectPreset(TimerPresetOption preset) {
    setState(() {
      selectedPreset = preset;
      time = _formatMinutes(preset.focusMinutes);
      sessionText = 'SESSION 1/${preset.cycles}';
      progress = 0;
      mode = PomodoroMode.focus;
    });

    Navigator.pop(context);
  }

  void _openPresetBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return TimerPresetBottomSheet(
          selectedPreset: selectedPreset,
          onPresetSelected: _selectPreset,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.2,
            colors: [Color(0xFF162014), AppColors.darkBackground],
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
                  onSettingsTap: _openPresetBottomSheet,
                ),

                const Spacer(),

                ModeChip(mode: mode),

                const SizedBox(height: 42),

                TimerCircle(
                  progress: progress,
                  time: time,
                  sessionText: sessionText,
                ),

                const SizedBox(height: 48),

                Controls(onPlay: () {}, onReset: () {}, onSkip: () {}),

                const Spacer(),

                BottomNav(
                  currentIndex: currentIndex,
                  onItemSelected: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
