// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Focus Zen';

  @override
  String get chooseTimer => 'Cycle Selection';

  @override
  String get focus => 'Focus';

  @override
  String get shortBreak => 'Short Break';

  @override
  String get longBreak => 'Long Break';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get noSessionsYet => 'No sessions yet. Start focusing!';

  @override
  String get completed => 'Completed';

  @override
  String get skipped => 'Skipped';

  @override
  String get today => 'Today';

  @override
  String get efficiencyRatio => 'Efficiency Ratio';

  @override
  String focusPercentage(Object value) {
    return 'Focus ($value%)';
  }

  @override
  String breakPercentage(Object value) {
    return 'Break ($value%)';
  }

  @override
  String get efficiencyDescription => 'Near optimal work-rest balance.';

  @override
  String get weeklyProgress => 'Weekly Progress';

  @override
  String get thisWeek => 'This Week';

  @override
  String get weekRangeShort => 'Mon - Sun';

  @override
  String averageShort(String value) {
    return 'Avg. $value';
  }

  @override
  String minutesShort(int value) {
    return '${value}m';
  }

  @override
  String hoursMinutesShort(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String get todayFocus => 'Today\'s Focus';

  @override
  String sessionsCompleted(int value) {
    return '$value sessions completed';
  }

  @override
  String get currentStreak => 'Current Streak';

  @override
  String daysCount(int value) {
    return '$value days';
  }

  @override
  String bestStreak(int value) {
    return 'Best streak: $value days';
  }

  @override
  String get statsHeaderTitle => 'Your Focus';

  @override
  String get statsHeaderSubtitle => 'Track your progress and stay consistent.';

  @override
  String get presetQuick => 'Quick Focus';

  @override
  String get presetClassic => 'Classic';

  @override
  String get presetStudy => 'Study';

  @override
  String get presetDeep => 'Deep Work';

  @override
  String presetSummary(int focus, int short, int long) {
    return '$focus min focus · $short min break · $long min long break';
  }

  @override
  String cyclesBeforeLongBreak(int value) {
    return '$value cycles before long break';
  }

  @override
  String get settings => 'Settings';

  @override
  String get settingsSubtitle => 'Tailor your path to deep focus.';

  @override
  String get timerPreferences => 'Timer Preferences';

  @override
  String get autoStartFocus => 'Auto-start focus';

  @override
  String get autoStartBreak => 'Auto-start break';

  @override
  String get feedback => 'Feedback';

  @override
  String get soundEffects => 'Sound effects';

  @override
  String get hapticVibration => 'Haptic vibration';

  @override
  String get completionSound => 'Completion sound';

  @override
  String get appearance => 'Appearance';

  @override
  String get language => 'Language';

  @override
  String get systemDefault => 'System default';

  @override
  String get portuguese => 'Portuguese';

  @override
  String get english => 'English';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get systemTheme => 'System';
}
