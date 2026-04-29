import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/data/models/pomodoro_mode.dart';
import '../../home/data/models/timer_history_entry.dart';
import '../../home/data/repositories/timer_history_repository.dart';
import 'stats_state.dart';

final statsControllerProvider = NotifierProvider<StatsController, StatsState>(
  StatsController.new,
);

class StatsController extends Notifier<StatsState> {
  @override
  StatsState build() {
    _loadStats();
    return StatsState.initial();
  }

  Future<void> refresh() async {
    await _loadStats();
  }

  Future<void> _loadStats() async {
    final entries = await ref.read(timerHistoryRepositoryProvider).getEntries();

    final focusEntries =
        entries.where((entry) => entry.mode == PomodoroMode.focus).toList()
          ..sort((a, b) => b.completedAt.compareTo(a.completedAt));

    state = StatsState(
      todayFocusMinutes: _todayFocusMinutes(focusEntries),
      todaySessions: _todaySessions(focusEntries),
      weeklyFocusMinutes: _weeklyFocusMinutes(focusEntries),
      currentStreak: _currentStreak(focusEntries),
      bestStreak: _bestStreak(focusEntries),
      recentSessions: focusEntries.take(5).toList(),
    );
  }

  int _todayFocusMinutes(List<TimerHistoryEntry> entries) {
    final now = DateTime.now();

    return entries
        .where((entry) => _isSameDay(entry.completedAt, now))
        .fold<int>(0, (total, entry) => total + entry.durationMinutes);
  }

  int _todaySessions(List<TimerHistoryEntry> entries) {
    final now = DateTime.now();

    return entries.where((entry) {
      return _isSameDay(entry.completedAt, now);
    }).length;
  }

  List<int> _weeklyFocusMinutes(List<TimerHistoryEntry> entries) {
    final now = DateTime.now();
    final startOfWeek = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(Duration(days: now.weekday - 1));

    final values = List<int>.filled(7, 0);

    for (final entry in entries) {
      final entryDay = _dateOnly(entry.completedAt);
      final diff = entryDay.difference(startOfWeek).inDays;

      if (diff >= 0 && diff < 7) {
        values[diff] += entry.durationMinutes;
      }
    }

    return values;
  }

  int _currentStreak(List<TimerHistoryEntry> entries) {
    final activeDays = _activeDays(entries);

    if (activeDays.isEmpty) return 0;

    var streak = 0;
    var day = _dateOnly(DateTime.now());

    while (activeDays.contains(day)) {
      streak++;
      day = day.subtract(const Duration(days: 1));
    }

    return streak;
  }

  int _bestStreak(List<TimerHistoryEntry> entries) {
    final days = _activeDays(entries).toList()..sort();

    if (days.isEmpty) return 0;

    var best = 1;
    var current = 1;

    for (var i = 1; i < days.length; i++) {
      final previous = days[i - 1];
      final currentDay = days[i];

      final difference = currentDay.difference(previous).inDays;

      if (difference == 1) {
        current++;
        if (current > best) best = current;
      } else if (difference > 1) {
        current = 1;
      }
    }

    return best;
  }

  Set<DateTime> _activeDays(List<TimerHistoryEntry> entries) {
    return entries.map((entry) => _dateOnly(entry.completedAt)).toSet();
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
