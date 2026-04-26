class TimerPresetOption {
  const TimerPresetOption({
    required this.id,
    required this.name,
    required this.focusMinutes,
    required this.shortBreakMinutes,
    required this.longBreakMinutes,
    required this.cycles,
  });

  final String id;
  final String name;
  final int focusMinutes;
  final int shortBreakMinutes;
  final int longBreakMinutes;
  final int cycles;

  String get summary {
    return '$focusMinutes min focus · $shortBreakMinutes min break · '
        '$longBreakMinutes min long break';
  }

  String get chipSubtitle {
    return '$focusMinutes / $shortBreakMinutes / $longBreakMinutes';
  }

  String get compact {
    return '${focusMinutes}m · ${shortBreakMinutes}m · ${cycles}x';
  }
}

const List<TimerPresetOption> timerPresetOptions = [
  TimerPresetOption(
    id: 'quick',
    name: 'Quick Focus',
    focusMinutes: 15,
    shortBreakMinutes: 3,
    longBreakMinutes: 10,
    cycles: 4,
  ),
  TimerPresetOption(
    id: 'classic',
    name: 'Classic',
    focusMinutes: 25,
    shortBreakMinutes: 5,
    longBreakMinutes: 15,
    cycles: 4,
  ),
  TimerPresetOption(
    id: 'study',
    name: 'Study',
    focusMinutes: 40,
    shortBreakMinutes: 10,
    longBreakMinutes: 20,
    cycles: 3,
  ),
  TimerPresetOption(
    id: 'deep',
    name: 'Deep Work',
    focusMinutes: 50,
    shortBreakMinutes: 10,
    longBreakMinutes: 25,
    cycles: 3,
  ),
];