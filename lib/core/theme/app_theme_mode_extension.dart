import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';


extension AppThemeModeX on ThemeMode {
  String label(AppLocalizations l10n) {
    switch (this) {
      case ThemeMode.light:
        return l10n.lightTheme;
      case ThemeMode.dark:
        return l10n.darkTheme;
      case ThemeMode.system:
        return l10n.systemTheme;
    }
  }
}

extension AppThemeModeFromString on String {
  ThemeMode toThemeMode(AppLocalizations l10n) {
    if (this == l10n.lightTheme) return ThemeMode.light;
    if (this == l10n.darkTheme) return ThemeMode.dark;
    if (this == l10n.systemTheme) return ThemeMode.system;

    return ThemeMode.system;
  }
}