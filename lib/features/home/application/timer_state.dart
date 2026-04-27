import '../data/models/timer_preset_option.dart';
import '../presentation/widgets/mode_chip.dart';

class TimerState {
  const TimerState({
    required this.selectedPreset,
    required this.mode,
    required this.remainingMilliseconds,
    required this.totalMilliseconds,
    required this.currentSession,
    required this.isRunning,
  });

  final TimerPresetOption selectedPreset;
  final PomodoroMode mode;
  final int remainingMilliseconds;
  final int totalMilliseconds;
  final int currentSession;
  final bool isRunning;

  int get remainingSeconds => (remainingMilliseconds / 1000).ceil();

  double get progress {
    if (totalMilliseconds == 0) return 0;

    final value = 1 - (remainingMilliseconds / totalMilliseconds);
    return value.clamp(0.0, 1.0);
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
    int? remainingMilliseconds,
    int? totalMilliseconds,
    int? currentSession,
    bool? isRunning,
  }) {
    return TimerState(
      selectedPreset: selectedPreset ?? this.selectedPreset,
      mode: mode ?? this.mode,
      remainingMilliseconds:
          remainingMilliseconds ?? this.remainingMilliseconds,
      totalMilliseconds: totalMilliseconds ?? this.totalMilliseconds,
      currentSession: currentSession ?? this.currentSession,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}