import 'package:flutter/material.dart';

class SettingsState {
  const SettingsState({
    required this.autoStartFocus,
    required this.autoStartBreak,
    required this.soundEffects,
    required this.hapticVibration,
    required this.themeMode,
  });

  final bool autoStartFocus;
  final bool autoStartBreak;
  final bool soundEffects;
  final bool hapticVibration;
  final ThemeMode themeMode;

  SettingsState copyWith({
    bool? autoStartFocus,
    bool? autoStartBreak,
    bool? soundEffects,
    bool? hapticVibration,
    ThemeMode? themeMode,
  }) {
    return SettingsState(
      autoStartFocus: autoStartFocus ?? this.autoStartFocus,
      autoStartBreak: autoStartBreak ?? this.autoStartBreak,
      soundEffects: soundEffects ?? this.soundEffects,
      hapticVibration: hapticVibration ?? this.hapticVibration,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  factory SettingsState.initial() {
    return const SettingsState(
      autoStartFocus: false,
      autoStartBreak: false,
      soundEffects: true,
      hapticVibration: true,
      themeMode: ThemeMode.dark,
    );
  }
}