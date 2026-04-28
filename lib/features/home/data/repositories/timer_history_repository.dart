import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/timer_history_entry.dart';

final timerHistoryRepositoryProvider = Provider<TimerHistoryRepository>((ref) {
  return TimerHistoryRepository();
});

class TimerHistoryRepository {
  static const _historyKey = 'timer_history_entries';

  Future<List<TimerHistoryEntry>> getEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final entries = prefs.getStringList(_historyKey) ?? [];

    return entries.map(TimerHistoryEntry.fromJson).toList()
      ..sort((a, b) => b.completedAt.compareTo(a.completedAt));
  }

  Future<void> addEntry(TimerHistoryEntry entry) async {
    final prefs = await SharedPreferences.getInstance();

    final entries = prefs.getStringList(_historyKey) ?? [];
    entries.add(entry.toJson());

    await prefs.setStringList(_historyKey, entries);
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }
}