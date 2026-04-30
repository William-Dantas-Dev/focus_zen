import '../../../../l10n/app_localizations.dart';
import '../../data/models/timer_preset_option.dart';

extension TimerPresetL10n on TimerPresetOption {
  String name(AppLocalizations l10n) {
    switch (id) {
      case 'quick':
        return l10n.presetQuick;
      case 'classic':
        return l10n.presetClassic;
      case 'study':
        return l10n.presetStudy;
      case 'deep':
        return l10n.presetDeep;
      default:
        return '';
    }
  }

  String summary(AppLocalizations l10n) {
    return l10n.presetSummary(
      focusMinutes,
      shortBreakMinutes,
      longBreakMinutes,
    );
  }
}
