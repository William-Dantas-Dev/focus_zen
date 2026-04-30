class TimerPresetOption {
  const TimerPresetOption({
    required this.id,
    required this.focusMinutes,
    required this.shortBreakMinutes,
    required this.longBreakMinutes,
    required this.cycles,
  });

  final String id;
  final int focusMinutes;
  final int shortBreakMinutes;
  final int longBreakMinutes;
  final int cycles;
}

const List<TimerPresetOption> timerPresetOptions = [
  TimerPresetOption(
    id: 'quick',
    focusMinutes: 15,
    shortBreakMinutes: 3,
    longBreakMinutes: 10,
    cycles: 4,
  ),
  TimerPresetOption(
    id: 'classic',
    focusMinutes: 25,
    shortBreakMinutes: 5,
    longBreakMinutes: 15,
    cycles: 4,
  ),
  TimerPresetOption(
    id: 'study',
    focusMinutes: 40,
    shortBreakMinutes: 10,
    longBreakMinutes: 20,
    cycles: 3,
  ),
  TimerPresetOption(
    id: 'deep',
    focusMinutes: 50,
    shortBreakMinutes: 10,
    longBreakMinutes: 25,
    cycles: 3,
  ),
];
