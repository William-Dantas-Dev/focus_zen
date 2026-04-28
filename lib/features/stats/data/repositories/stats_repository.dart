import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/focus_session.dart';

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  return StatsRepository();
});

class StatsRepository {
  static const _key = 'focus_sessions';

  Future<void> saveSession(FocusSession session) async {
    final prefs = await SharedPreferences.getInstance();

    final sessions = await getSessions();

    sessions.add(session);

    final jsonList = sessions.map((e) => e.toJson()).toList();

    await prefs.setString(_key, jsonEncode(jsonList));
  }

  Future<List<FocusSession>> getSessions() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString(_key);

    if (jsonString == null) return [];

    final List decoded = jsonDecode(jsonString);

    return decoded
        .map((e) => FocusSession.fromJson(e))
        .toList();
  }

  Future<void> clearSessions() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}