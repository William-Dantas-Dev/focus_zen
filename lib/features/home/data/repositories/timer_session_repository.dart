import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/pomodoro_mode.dart';

final timerSessionRepositoryProvider = Provider<TimerSessionRepository>((ref) {
  return TimerSessionRepository();
});

class TimerSessionRepository {
  static const _presetIdKey = 'timer_session_preset_id';
  static const _modeKey = 'timer_session_mode';
  static const _remainingMillisecondsKey = 'timer_session_remaining_ms';
  static const _totalMillisecondsKey = 'timer_session_total_ms';
  static const _currentSessionKey = 'timer_session_current_session';
  static const _isRunningKey = 'timer_session_is_running';
  static const _endTimeKey = 'timer_session_end_time';

  Future<void> saveSession({
    required String presetId,
    required PomodoroMode mode,
    required int remainingMilliseconds,
    required int totalMilliseconds,
    required int currentSession,
    required bool isRunning,
    DateTime? endTime,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_presetIdKey, presetId);
    await prefs.setString(_modeKey, mode.name);
    await prefs.setInt(_remainingMillisecondsKey, remainingMilliseconds);
    await prefs.setInt(_totalMillisecondsKey, totalMilliseconds);
    await prefs.setInt(_currentSessionKey, currentSession);
    await prefs.setBool(_isRunningKey, isRunning);

    if (endTime != null) {
      await prefs.setString(_endTimeKey, endTime.toIso8601String());
    } else {
      await prefs.remove(_endTimeKey);
    }
  }

  Future<SavedTimerSession?> getSession() async {
    final prefs = await SharedPreferences.getInstance();

    final presetId = prefs.getString(_presetIdKey);
    final modeName = prefs.getString(_modeKey);
    final remainingMilliseconds = prefs.getInt(_remainingMillisecondsKey);
    final totalMilliseconds = prefs.getInt(_totalMillisecondsKey);
    final currentSession = prefs.getInt(_currentSessionKey);
    final isRunning = prefs.getBool(_isRunningKey);

    if (presetId == null ||
        modeName == null ||
        remainingMilliseconds == null ||
        totalMilliseconds == null ||
        currentSession == null ||
        isRunning == null) {
      return null;
    }

    final mode = PomodoroMode.values.firstWhere(
      (value) => value.name == modeName,
      orElse: () => PomodoroMode.focus,
    );

    final endTimeValue = prefs.getString(_endTimeKey);
    final endTime = endTimeValue == null ? null : DateTime.tryParse(endTimeValue);

    return SavedTimerSession(
      presetId: presetId,
      mode: mode,
      remainingMilliseconds: remainingMilliseconds,
      totalMilliseconds: totalMilliseconds,
      currentSession: currentSession,
      isRunning: isRunning,
      endTime: endTime,
    );
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_presetIdKey);
    await prefs.remove(_modeKey);
    await prefs.remove(_remainingMillisecondsKey);
    await prefs.remove(_totalMillisecondsKey);
    await prefs.remove(_currentSessionKey);
    await prefs.remove(_isRunningKey);
    await prefs.remove(_endTimeKey);
  }
}

class SavedTimerSession {
  const SavedTimerSession({
    required this.presetId,
    required this.mode,
    required this.remainingMilliseconds,
    required this.totalMilliseconds,
    required this.currentSession,
    required this.isRunning,
    required this.endTime,
  });

  final String presetId;
  final PomodoroMode mode;
  final int remainingMilliseconds;
  final int totalMilliseconds;
  final int currentSession;
  final bool isRunning;
  final DateTime? endTime;
}