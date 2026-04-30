import '../../home/data/models/timer_history_entry.dart';

class StatsState {
  const StatsState({
    required this.todayFocusMinutes,
    required this.todaySessions,
    required this.weeklyFocusMinutes,
    required this.currentStreak,
    required this.bestStreak,
    required this.recentSessions,
    required this.focusMinutes,
    required this.breakMinutes,
  });

  final int todayFocusMinutes;
  final int todaySessions;
  final List<int> weeklyFocusMinutes;
  final int currentStreak;
  final int bestStreak;
  final List<TimerHistoryEntry> recentSessions;
  final int focusMinutes;
  final int breakMinutes;

  factory StatsState.initial() {
    return const StatsState(
      todayFocusMinutes: 0,
      todaySessions: 0,
      weeklyFocusMinutes: [0, 0, 0, 0, 0, 0, 0],
      currentStreak: 0,
      bestStreak: 0,
      recentSessions: [],
      focusMinutes: 0,
      breakMinutes: 0,
    );
  }

  int get totalTrackedMinutes => focusMinutes + breakMinutes;

  double get focusRatio {
    if (totalTrackedMinutes == 0) return 0;
    return focusMinutes / totalTrackedMinutes;
  }

  int get focusPercentage => (focusRatio * 100).round();

  int get breakPercentage {
    if (totalTrackedMinutes == 0) return 0;
    return 100 - focusPercentage;
  }

  String get todayFocusFormatted {
    final hours = todayFocusMinutes ~/ 60;
    final minutes = todayFocusMinutes % 60;

    if (hours == 0) {
      return '${minutes}m';
    }

    return '${hours}h ${minutes}m';
  }
}
