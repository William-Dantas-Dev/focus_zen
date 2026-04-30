// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Focus Zen';

  @override
  String get chooseTimer => 'Escolha de Ciclo';

  @override
  String get focus => 'Foco';

  @override
  String get shortBreak => 'Pausa Curta';

  @override
  String get longBreak => 'Pausa Longa';

  @override
  String get recentActivity => 'Atividade Recente';

  @override
  String get noSessionsYet => 'Nenhuma sessão ainda. Comece a focar!';

  @override
  String get completed => 'Concluída';

  @override
  String get skipped => 'Pulada';

  @override
  String get today => 'Hoje';

  @override
  String get efficiencyRatio => 'Taxa de Eficiência';

  @override
  String focusPercentage(Object value) {
    return 'Foco ($value%)';
  }

  @override
  String breakPercentage(Object value) {
    return 'Pausa ($value%)';
  }

  @override
  String get efficiencyDescription => 'Equilíbrio quase ideal entre foco e descanso.';

  @override
  String get weeklyProgress => 'Progresso Semanal';

  @override
  String get thisWeek => 'Esta Semana';

  @override
  String get weekRangeShort => 'Seg - Dom';

  @override
  String averageShort(String value) {
    return 'Méd. $value';
  }

  @override
  String minutesShort(int value) {
    return '${value}min';
  }

  @override
  String hoursMinutesShort(int hours, int minutes) {
    return '${hours}h ${minutes}min';
  }

  @override
  String get todayFocus => 'Foco de Hoje';

  @override
  String sessionsCompleted(int value) {
    return '$value sessões concluídas';
  }

  @override
  String get currentStreak => 'Sequência Atual';

  @override
  String daysCount(int value) {
    return '$value dias';
  }

  @override
  String bestStreak(int value) {
    return 'Melhor sequência: $value dias';
  }

  @override
  String get statsHeaderTitle => 'Seu Foco';

  @override
  String get statsHeaderSubtitle => 'Acompanhe seu progresso e mantenha consistência.';

  @override
  String get presetQuick => 'Foco Rápido';

  @override
  String get presetClassic => 'Clássico';

  @override
  String get presetStudy => 'Estudo';

  @override
  String get presetDeep => 'Foco Profundo';

  @override
  String presetSummary(int focus, int short, int long) {
    return '$focus min foco · $short min pausa · $long min pausa longa';
  }

  @override
  String cyclesBeforeLongBreak(int value) {
    return '$value ciclos antes da pausa longa';
  }

  @override
  String get settings => 'Configurações';

  @override
  String get settingsSubtitle => 'Ajuste seu caminho para o foco profundo.';

  @override
  String get timerPreferences => 'Preferências do Timer';

  @override
  String get autoStartFocus => 'Iniciar foco automaticamente';

  @override
  String get autoStartBreak => 'Iniciar pausa automaticamente';

  @override
  String get feedback => 'Feedback';

  @override
  String get soundEffects => 'Efeitos sonoros';

  @override
  String get hapticVibration => 'Vibração';

  @override
  String get completionSound => 'Som de conclusão';

  @override
  String get appearance => 'Aparência';

  @override
  String get language => 'Idioma';

  @override
  String get systemDefault => 'Padrão do sistema';

  @override
  String get portuguese => 'Português';

  @override
  String get english => 'Inglês';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Escuro';

  @override
  String get systemTheme => 'Sistema';
}
