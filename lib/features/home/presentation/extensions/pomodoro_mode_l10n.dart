import '../../../../l10n/app_localizations.dart';
import '../../data/models/pomodoro_mode.dart';

extension PomodoroModeL10n on PomodoroMode {
  String label(AppLocalizations l10n) {
    switch (this) {
      case PomodoroMode.focus:
        return l10n.focus;
      case PomodoroMode.shortBreak:
        return l10n.shortBreak;
      case PomodoroMode.longBreak:
        return l10n.longBreak;
    }
  }
}