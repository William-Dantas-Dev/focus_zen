import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/settings_repository.dart';
import 'settings_state.dart';

final settingsControllerProvider =
    NotifierProvider<SettingsController, SettingsState>(
  SettingsController.new,
);

class SettingsController extends Notifier<SettingsState> {
  @override
  SettingsState build() {
    _loadSettings();
    return SettingsState.initial();
  }

  Future<void> _loadSettings() async {
    final repository = ref.read(settingsRepositoryProvider);

    final autoStartFocus = await repository.getAutoStartFocus();
    final autoStartBreak = await repository.getAutoStartBreak();
    final soundEffects = await repository.getSoundEffects();
    final hapticVibration = await repository.getHapticVibration();
    final themeMode = await repository.getThemeMode();

    state = SettingsState(
      autoStartFocus: autoStartFocus,
      autoStartBreak: autoStartBreak,
      soundEffects: soundEffects,
      hapticVibration: hapticVibration,
      themeMode: themeMode,
    );
  }

  Future<void> setAutoStartFocus(bool value) async {
    state = state.copyWith(autoStartFocus: value);
    await ref.read(settingsRepositoryProvider).setAutoStartFocus(value);
  }

  Future<void> setAutoStartBreak(bool value) async {
    state = state.copyWith(autoStartBreak: value);
    await ref.read(settingsRepositoryProvider).setAutoStartBreak(value);
  }

  Future<void> setSoundEffects(bool value) async {
    state = state.copyWith(soundEffects: value);
    await ref.read(settingsRepositoryProvider).setSoundEffects(value);
  }

  Future<void> setHapticVibration(bool value) async {
    state = state.copyWith(hapticVibration: value);
    await ref.read(settingsRepositoryProvider).setHapticVibration(value);
  }

  Future<void> setThemeMode(ThemeMode value) async {
    state = state.copyWith(themeMode: value);
    await ref.read(settingsRepositoryProvider).setThemeMode(value);
  }
}