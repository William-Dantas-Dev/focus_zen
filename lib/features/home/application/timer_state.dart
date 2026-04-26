import '../presentation/widgets/mode_chip.dart';
import '../presentation/widgets/timer_preset_option.dart';

class TimerState {
  const TimerState({
    required this.selectedPreset,
    required this.mode,
    required this.remainingSeconds,
    required this.totalSeconds,
    required this.currentSession,
    required this.isRunning,
  });

  final TimerPresetOption selectedPreset;
  final PomodoroMode mode;
  final int remainingSeconds;
  final int totalSeconds;
  final int currentSession;
  final bool isRunning;

  double get progress {
    if (totalSeconds == 0) return 0;
    return 1 - (remainingSeconds / totalSeconds);
  }

  String get formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  String get sessionText {
    return 'SESSION $currentSession/${selectedPreset.cycles}';
  }

  TimerState copyWith({
    TimerPresetOption? selectedPreset,
    PomodoroMode? mode,
    int? remainingSeconds,
    int? totalSeconds,
    int? currentSession,
    bool? isRunning,
  }) {
    return TimerState(
      selectedPreset: selectedPreset ?? this.selectedPreset,
      mode: mode ?? this.mode,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      totalSeconds: totalSeconds ?? this.totalSeconds,
      currentSession: currentSession ?? this.currentSession,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}