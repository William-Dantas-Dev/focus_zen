import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/audio_provider.dart';
import '../../../core/providers/feedback_provider.dart';
import '../data/models/pomodoro_mode.dart';
import '../data/models/timer_preset_option.dart';
import '../data/repositories/timer_preset_repository.dart';
import '../data/repositories/timer_session_repository.dart';
import 'timer_state.dart';

final timerControllerProvider = NotifierProvider<TimerController, TimerState>(
  TimerController.new,
);

class TimerController extends Notifier<TimerState> {
  Timer? _timer;
  DateTime? _endTime;

  static const _tickDuration = Duration(milliseconds: 100);

  @override
  TimerState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    final preset = timerPresetOptions.first;
    final totalMilliseconds = preset.focusMinutes * 60 * 1000;

    _loadSavedSession();

    return TimerState(
      selectedPreset: preset,
      mode: PomodoroMode.focus,
      remainingMilliseconds: totalMilliseconds,
      totalMilliseconds: totalMilliseconds,
      currentSession: 1,
      isRunning: false,
    );
  }

  Future<void> _loadSavedSession() async {
    final session = await ref.read(timerSessionRepositoryProvider).getSession();

    if (session == null) {
      await _loadSavedPreset();
      return;
    }

    final preset = timerPresetOptions.firstWhere(
      (preset) => preset.id == session.presetId,
      orElse: () => timerPresetOptions.first,
    );

    var remainingMilliseconds = session.remainingMilliseconds;
    var isRunning = session.isRunning;

    if (session.isRunning && session.endTime != null) {
      final remainingFromEndTime = session.endTime!
          .difference(DateTime.now())
          .inMilliseconds;

      if (remainingFromEndTime <= 0) {
        state = TimerState(
          selectedPreset: preset,
          mode: session.mode,
          remainingMilliseconds: 0,
          totalMilliseconds: session.totalMilliseconds,
          currentSession: session.currentSession,
          isRunning: false,
        );

        _goToNextMode();
        return;
      }

      remainingMilliseconds = remainingFromEndTime;
      isRunning = true;
      _endTime = session.endTime;

      _timer?.cancel();
      _timer = Timer.periodic(_tickDuration, (_) {
        _tick();
      });
    }

    state = TimerState(
      selectedPreset: preset,
      mode: session.mode,
      remainingMilliseconds: remainingMilliseconds,
      totalMilliseconds: session.totalMilliseconds,
      currentSession: session.currentSession,
      isRunning: isRunning,
    );
  }

  Future<void> _loadSavedPreset() async {
    final preset = await ref
        .read(timerPresetRepositoryProvider)
        .getSelectedPreset();

    final totalMilliseconds = preset.focusMinutes * 60 * 1000;

    state = TimerState(
      selectedPreset: preset,
      mode: PomodoroMode.focus,
      remainingMilliseconds: totalMilliseconds,
      totalMilliseconds: totalMilliseconds,
      currentSession: 1,
      isRunning: false,
    );

    await _saveSession();
  }

  void toggle() {
    state.isRunning ? pause() : start();
  }

  void start() {
    if (state.isRunning) return;

    _endTime = DateTime.now().add(
      Duration(milliseconds: state.remainingMilliseconds),
    );

    state = state.copyWith(isRunning: true);

    _timer?.cancel();
    _timer = Timer.periodic(_tickDuration, (_) {
      _tick();
    });

    _tick();
    _saveSession();
  }

  void _tick() {
    final endTime = _endTime;
    if (endTime == null) return;

    final remaining = endTime.difference(DateTime.now()).inMilliseconds;

    if (remaining <= 0) {
      _goToNextMode();
      return;
    }

    state = state.copyWith(remainingMilliseconds: remaining);

    _saveSession();
  }

  void pause() {
    _timer?.cancel();
    _endTime = null;

    state = state.copyWith(isRunning: false);
    _saveSession();
  }

  void reset() {
    _timer?.cancel();
    _endTime = null;

    final totalMilliseconds = _millisecondsForMode(
      state.mode,
      state.selectedPreset,
    );

    state = state.copyWith(
      remainingMilliseconds: totalMilliseconds,
      totalMilliseconds: totalMilliseconds,
      isRunning: false,
    );

    _saveSession();
  }

  void skip() {
    _timer?.cancel();
    _endTime = null;
    _goToNextMode();
  }

  Future<void> selectPreset(TimerPresetOption preset) async {
    _timer?.cancel();
    _endTime = null;

    await ref
        .read(timerPresetRepositoryProvider)
        .saveSelectedPresetId(preset.id);

    final totalMilliseconds = preset.focusMinutes * 60 * 1000;

    state = TimerState(
      selectedPreset: preset,
      mode: PomodoroMode.focus,
      remainingMilliseconds: totalMilliseconds,
      totalMilliseconds: totalMilliseconds,
      currentSession: 1,
      isRunning: false,
    );

    await _saveSession();
  }

  void _goToNextMode() {
    final nextMode = _nextMode();
    final nextSession = _nextSession(nextMode);

    final totalMilliseconds = _millisecondsForMode(
      nextMode,
      state.selectedPreset,
    );

    _timer?.cancel();
    _endTime = null;

    _playSessionFeedback();

    state = state.copyWith(
      mode: nextMode,
      remainingMilliseconds: totalMilliseconds,
      totalMilliseconds: totalMilliseconds,
      currentSession: nextSession,
      isRunning: false,
    );

    _saveSession();
  }

  Future<void> _saveSession() async {
    await ref
        .read(timerSessionRepositoryProvider)
        .saveSession(
          presetId: state.selectedPreset.id,
          mode: state.mode,
          remainingMilliseconds: state.remainingMilliseconds,
          totalMilliseconds: state.totalMilliseconds,
          currentSession: state.currentSession,
          isRunning: state.isRunning,
          endTime: _endTime,
        );
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
      return nextSession > state.selectedPreset.cycles ? 1 : nextSession;
    }

    return state.currentSession;
  }

  int _millisecondsForMode(PomodoroMode mode, TimerPresetOption preset) {
    switch (mode) {
      case PomodoroMode.focus:
        return preset.focusMinutes * 60 * 1000;
      case PomodoroMode.shortBreak:
        return preset.shortBreakMinutes * 60 * 1000;
      case PomodoroMode.longBreak:
        return preset.longBreakMinutes * 60 * 1000;
    }
  }

  Future<void> _playSessionFeedback() async {
    await ref.read(feedbackServiceProvider).vibrate();
    await ref.read(audioServiceProvider).playBeep();
  }
}
