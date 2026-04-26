import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/timer_preset_option.dart';

final timerPresetRepositoryProvider = Provider<TimerPresetRepository>((ref) {
  return TimerPresetRepository();
});

class TimerPresetRepository {
  static const String _selectedPresetKey = 'selected_timer_preset_id';

  Future<void> saveSelectedPresetId(String presetId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedPresetKey, presetId);
  }

  Future<String?> getSelectedPresetId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_selectedPresetKey);
  }

  Future<TimerPresetOption> getSelectedPreset() async {
    final savedPresetId = await getSelectedPresetId();

    if (savedPresetId == null) {
      return timerPresetOptions.first;
    }

    return timerPresetOptions.firstWhere(
      (preset) => preset.id == savedPresetId,
      orElse: () => timerPresetOptions.first,
    );
  }
}
