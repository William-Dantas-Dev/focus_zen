import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/focus_session.dart';
import '../data/repositories/stats_repository.dart';
import 'stats_state.dart';

final statsControllerProvider =
    NotifierProvider<StatsController, StatsState>(StatsController.new);

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
    final sessions = await ref.read(statsRepositoryProvider).getSessions();

    sessions.sort((a, b) => b.endedAt.compareTo(a.endedAt));

    state = StatsState(
      todayFocusMinutes: _todayFocusMinutes(sessions),
      todaySessions: _todaySessions(sessions),
      weeklyFocusMinutes: _weeklyFocusMinutes(sessions),
      currentStreak: _currentStreak(sessions),
      bestStreak: _bestStreak(sessions),
      recentSessions: sessions.take(5).toList(),
    );
  }

  int _todayFocusMinutes(List<FocusSession> sessions) {
    final now = DateTime.now();

    return sessions
        .where((session) => _isSameDay(session.endedAt, now))
        .fold<int>(
          0,
          (total, session) => total + session.durationMinutes,
        );
  }

  int _todaySessions(List<FocusSession> sessions) {
    final now = DateTime.now();

    return sessions.where((session) {
      return _isSameDay(session.endedAt, now);
    }).length;
  }

  List<int> _weeklyFocusMinutes(List<FocusSession> sessions) {
    final now = DateTime.now();
    final startOfWeek = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(Duration(days: now.weekday - 1));

    final values = List<int>.filled(7, 0);

    for (final session in sessions) {
      final sessionDay = DateTime(
        session.endedAt.year,
        session.endedAt.month,
        session.endedAt.day,
      );

      final diff = sessionDay.difference(startOfWeek).inDays;

      if (diff >= 0 && diff < 7) {
        values[diff] += session.durationMinutes;
      }
    }

    return values;
  }

  int _currentStreak(List<FocusSession> sessions) {
    final activeDays = _activeDays(sessions);

    if (activeDays.isEmpty) return 0;

    var streak = 0;
    var day = _dateOnly(DateTime.now());

    while (activeDays.contains(day)) {
      streak++;
      day = day.subtract(const Duration(days: 1));
    }

    return streak;
  }

  int _bestStreak(List<FocusSession> sessions) {
    final days = _activeDays(sessions).toList()..sort();

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

  Set<DateTime> _activeDays(List<FocusSession> sessions) {
    return sessions.map((session) => _dateOnly(session.endedAt)).toSet();
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}