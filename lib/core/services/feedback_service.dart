import 'package:vibration/vibration.dart';

class FeedbackService {
  Future<void> vibrate() async {
    final hasVibrator = await Vibration.hasVibrator();

    if (hasVibrator ?? false) {
      await Vibration.vibrate(duration: 200);
    }
  }
}