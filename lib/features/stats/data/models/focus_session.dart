class FocusSession {
  const FocusSession({
    required this.id,
    required this.startedAt,
    required this.endedAt,
    required this.durationMinutes,
    required this.presetName,
  });

  final String id;
  final DateTime startedAt;
  final DateTime endedAt;
  final int durationMinutes;
  final String presetName;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startedAt': startedAt.toIso8601String(),
      'endedAt': endedAt.toIso8601String(),
      'durationMinutes': durationMinutes,
      'presetName': presetName,
    };
  }

  factory FocusSession.fromJson(Map<String, dynamic> json) {
    return FocusSession(
      id: json['id'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
      durationMinutes: json['durationMinutes'] as int,
      presetName: json['presetName'] as String,
    );
  }
}