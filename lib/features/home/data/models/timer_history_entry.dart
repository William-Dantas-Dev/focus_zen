import 'dart:convert';

import 'pomodoro_mode.dart';

class TimerHistoryEntry {
  const TimerHistoryEntry({
    required this.id,
    required this.presetId,
    required this.mode,
    required this.durationMilliseconds,
    required this.completedAt,
    required this.wasCompleted,
  });

  final String id;
  final String presetId;
  final PomodoroMode mode;
  final int durationMilliseconds;
  final DateTime completedAt;
  final bool wasCompleted;

  int get durationMinutes {
    return (durationMilliseconds / 60000).round();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'presetId': presetId,
      'mode': mode.name,
      'durationMilliseconds': durationMilliseconds,
      'completedAt': completedAt.toIso8601String(),
      'wasCompleted': wasCompleted,
    };
  }

  factory TimerHistoryEntry.fromMap(Map<String, dynamic> map) {
    return TimerHistoryEntry(
      id: map['id'] as String,
      presetId: map['presetId'] as String,
      mode: PomodoroMode.values.firstWhere(
        (mode) => mode.name == map['mode'],
        orElse: () => PomodoroMode.focus,
      ),
      durationMilliseconds: map['durationMilliseconds'] as int,
      completedAt: DateTime.parse(map['completedAt'] as String),
      wasCompleted: map['wasCompleted'] as bool,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory TimerHistoryEntry.fromJson(String source) {
    return TimerHistoryEntry.fromMap(
      jsonDecode(source) as Map<String, dynamic>,
    );
  }
}