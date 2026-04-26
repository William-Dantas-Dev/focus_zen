import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/timer_preset_option.dart';
import '../data/repositories/timer_preset_repository.dart';
import '../presentation/widgets/mode_chip.dart';
import 'timer_state.dart';

final timerControllerProvider = NotifierProvider<TimerController, TimerState>(
  TimerController.new,
);

class TimerController extends Notifier<TimerState> {
  Timer? _timer;

  @override
  TimerState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    final preset = timerPresetOptions.first;
    final totalSeconds = preset.focusMinutes * 60;

    _loadSavedPreset();

    return TimerState(
      selectedPreset: preset,
      mode: PomodoroMode.focus,
      remainingSeconds: totalSeconds,
      totalSeconds: totalSeconds,
      currentSession: 1,
      isRunning: false,
    );
  }

  Future<void> _loadSavedPreset() async {
    final preset = await ref
        .read(timerPresetRepositoryProvider)
        .getSelectedPreset();

    final totalSeconds = preset.focusMinutes * 60;

    state = TimerState(
      selectedPreset: preset,
      mode: PomodoroMode.focus,
      remainingSeconds: totalSeconds,
      totalSeconds: totalSeconds,
      currentSession: 1,
      isRunning: false,
    );
  }

  void toggle() {
    state.isRunning ? pause() : start();
  }

  void start() {
    if (state.isRunning) return;

    state = state.copyWith(isRunning: true);

    _tick();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _tick();
    });
  }

  void _tick() {
    if (state.remainingSeconds <= 1) {
      _goToNextMode();
      return;
    }

    state = state.copyWith(remainingSeconds: state.remainingSeconds - 1);
  }

  void pause() {
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
  }

  void reset() {
    _timer?.cancel();

    final totalSeconds = _secondsForMode(state.mode, state.selectedPreset);

    state = state.copyWith(
      remainingSeconds: totalSeconds,
      totalSeconds: totalSeconds,
      isRunning: false,
    );
  }

  void skip() {
    _timer?.cancel();
    _goToNextMode();
  }

  Future<void> selectPreset(TimerPresetOption preset) async {
    _timer?.cancel();

    await ref
        .read(timerPresetRepositoryProvider)
        .saveSelectedPresetId(preset.id);

    final totalSeconds = preset.focusMinutes * 60;

    state = TimerState(
      selectedPreset: preset,
      mode: PomodoroMode.focus,
      remainingSeconds: totalSeconds,
      totalSeconds: totalSeconds,
      currentSession: 1,
      isRunning: false,
    );
  }

  void _goToNextMode() {
    final nextMode = _nextMode();
    final nextSession = _nextSession(nextMode);
    final totalSeconds = _secondsForMode(nextMode, state.selectedPreset);

    state = state.copyWith(
      mode: nextMode,
      remainingSeconds: totalSeconds,
      totalSeconds: totalSeconds,
      currentSession: nextSession,
      isRunning: false,
    );

    _timer?.cancel();
  }

  PomodoroMode _nextMode() {
    if (state.mode == PomodoroMode.focus) {
      final shouldTakeLongBreak =
          state.currentSession % state.selectedPreset.cycles == 0;

      return shouldTakeLongBreak
          ? PomodoroMode.longBreak
          : PomodoroMode.shortBreak;
    }

    return PomodoroMode.focus;
  }

  int _nextSession(PomodoroMode nextMode) {
    if (state.mode != PomodoroMode.focus && nextMode == PomodoroMode.focus) {
      final nextSession = state.currentSession + 1;

      if (nextSession > state.selectedPreset.cycles) {
        return 1;
      }

      return nextSession;
    }

    return state.currentSession;
  }

  int _secondsForMode(PomodoroMode mode, TimerPresetOption preset) {
    switch (mode) {
      case PomodoroMode.focus:
        return preset.focusMinutes * 60;
      case PomodoroMode.shortBreak:
        return preset.shortBreakMinutes * 60;
      case PomodoroMode.longBreak:
        return preset.longBreakMinutes * 60;
    }
  }
}
