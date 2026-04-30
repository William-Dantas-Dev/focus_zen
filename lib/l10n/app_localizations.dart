import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// App name
  ///
  /// In en, this message translates to:
  /// **'Focus Zen'**
  String get appName;

  /// Bottom sheet title for choosing a timer preset
  ///
  /// In en, this message translates to:
  /// **'Cycle Selection'**
  String get chooseTimer;

  /// No description provided for @focus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get focus;

  /// No description provided for @shortBreak.
  ///
  /// In en, this message translates to:
  /// **'Short Break'**
  String get shortBreak;

  /// No description provided for @longBreak.
  ///
  /// In en, this message translates to:
  /// **'Long Break'**
  String get longBreak;

  /// No description provided for @recentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get recentActivity;

  /// No description provided for @noSessionsYet.
  ///
  /// In en, this message translates to:
  /// **'No sessions yet. Start focusing!'**
  String get noSessionsYet;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @skipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get skipped;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @efficiencyRatio.
  ///
  /// In en, this message translates to:
  /// **'Efficiency Ratio'**
  String get efficiencyRatio;

  /// No description provided for @focusPercentage.
  ///
  /// In en, this message translates to:
  /// **'Focus ({value}%)'**
  String focusPercentage(Object value);

  /// No description provided for @breakPercentage.
  ///
  /// In en, this message translates to:
  /// **'Break ({value}%)'**
  String breakPercentage(Object value);

  /// No description provided for @efficiencyDescription.
  ///
  /// In en, this message translates to:
  /// **'Near optimal work-rest balance.'**
  String get efficiencyDescription;

  /// No description provided for @weeklyProgress.
  ///
  /// In en, this message translates to:
  /// **'Weekly Progress'**
  String get weeklyProgress;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @weekRangeShort.
  ///
  /// In en, this message translates to:
  /// **'Mon - Sun'**
  String get weekRangeShort;

  /// No description provided for @averageShort.
  ///
  /// In en, this message translates to:
  /// **'Avg. {value}'**
  String averageShort(String value);

  /// No description provided for @minutesShort.
  ///
  /// In en, this message translates to:
  /// **'{value}m'**
  String minutesShort(int value);

  /// No description provided for @hoursMinutesShort.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String hoursMinutesShort(int hours, int minutes);

  /// No description provided for @todayFocus.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Focus'**
  String get todayFocus;

  /// No description provided for @sessionsCompleted.
  ///
  /// In en, this message translates to:
  /// **'{value} sessions completed'**
  String sessionsCompleted(int value);

  /// No description provided for @currentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current Streak'**
  String get currentStreak;

  /// No description provided for @daysCount.
  ///
  /// In en, this message translates to:
  /// **'{value} days'**
  String daysCount(int value);

  /// No description provided for @bestStreak.
  ///
  /// In en, this message translates to:
  /// **'Best streak: {value} days'**
  String bestStreak(int value);

  /// No description provided for @statsHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Focus'**
  String get statsHeaderTitle;

  /// No description provided for @statsHeaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and stay consistent.'**
  String get statsHeaderSubtitle;

  /// No description provided for @presetQuick.
  ///
  /// In en, this message translates to:
  /// **'Quick Focus'**
  String get presetQuick;

  /// No description provided for @presetClassic.
  ///
  /// In en, this message translates to:
  /// **'Classic'**
  String get presetClassic;

  /// No description provided for @presetStudy.
  ///
  /// In en, this message translates to:
  /// **'Study'**
  String get presetStudy;

  /// No description provided for @presetDeep.
  ///
  /// In en, this message translates to:
  /// **'Deep Work'**
  String get presetDeep;

  /// No description provided for @presetSummary.
  ///
  /// In en, this message translates to:
  /// **'{focus} min focus · {short} min break · {long} min long break'**
  String presetSummary(int focus, int short, int long);

  /// No description provided for @cyclesBeforeLongBreak.
  ///
  /// In en, this message translates to:
  /// **'{value} cycles before long break'**
  String cyclesBeforeLongBreak(int value);

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tailor your path to deep focus.'**
  String get settingsSubtitle;

  /// No description provided for @timerPreferences.
  ///
  /// In en, this message translates to:
  /// **'Timer Preferences'**
  String get timerPreferences;

  /// No description provided for @autoStartFocus.
  ///
  /// In en, this message translates to:
  /// **'Auto-start focus'**
  String get autoStartFocus;

  /// No description provided for @autoStartBreak.
  ///
  /// In en, this message translates to:
  /// **'Auto-start break'**
  String get autoStartBreak;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @soundEffects.
  ///
  /// In en, this message translates to:
  /// **'Sound effects'**
  String get soundEffects;

  /// No description provided for @hapticVibration.
  ///
  /// In en, this message translates to:
  /// **'Haptic vibration'**
  String get hapticVibration;

  /// No description provided for @completionSound.
  ///
  /// In en, this message translates to:
  /// **'Completion sound'**
  String get completionSound;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemDefault;

  /// No description provided for @portuguese.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get portuguese;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
