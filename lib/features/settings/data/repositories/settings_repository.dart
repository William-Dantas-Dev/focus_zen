import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository();
});

class SettingsRepository {
  static const _autoStartFocusKey = 'settings_auto_start_focus';
  static const _autoStartBreakKey = 'settings_auto_start_break';
  static const _soundEffectsKey = 'settings_sound_effects';
  static const _hapticVibrationKey = 'settings_haptic_vibration';
  static const _themeModeKey = 'settings_theme_mode';

  Future<bool> getAutoStartFocus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_autoStartFocusKey) ?? false;
  }

  Future<void> setAutoStartFocus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_autoStartFocusKey, value);
  }

  Future<bool> getAutoStartBreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_autoStartBreakKey) ?? false;
  }

  Future<void> setAutoStartBreak(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_autoStartBreakKey, value);
  }

  Future<bool> getSoundEffects() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_soundEffectsKey) ?? true;
  }

  Future<void> setSoundEffects(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_soundEffectsKey, value);
  }

  Future<bool> getHapticVibration() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hapticVibrationKey) ?? true;
  }

  Future<void> setHapticVibration(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hapticVibrationKey, value);
  }

  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_themeModeKey);

    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      'system' => ThemeMode.system,
      _ => ThemeMode.dark,
    };
  }

  Future<void> setThemeMode(ThemeMode value) async {
    final prefs = await SharedPreferences.getInstance();

    final stringValue = switch (value) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };

    await prefs.setString(_themeModeKey, stringValue);
  }
}