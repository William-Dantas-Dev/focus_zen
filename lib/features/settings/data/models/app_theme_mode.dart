import 'package:flutter/material.dart';

extension AppThemeMode on ThemeMode {
  String get label {
    switch (this) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }
}

extension AppThemeModeFromString on String {
  ThemeMode toThemeMode() {
    switch (this) {
      case 'Light':
        return ThemeMode.light;
      case 'Dark':
        return ThemeMode.dark;
      case 'System':
        return ThemeMode.system;
      default:
        return ThemeMode.dark;
    }
  }
}