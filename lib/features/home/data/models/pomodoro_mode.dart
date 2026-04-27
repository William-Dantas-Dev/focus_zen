enum PomodoroMode {
  focus,
  shortBreak,
  longBreak;

  String get label {
    switch (this) {
      case PomodoroMode.focus:
        return 'FOCUS';
      case PomodoroMode.shortBreak:
        return 'SHORT BREAK';
      case PomodoroMode.longBreak:
        return 'LONG BREAK';
    }
  }
}