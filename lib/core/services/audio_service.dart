import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playBeep() async {
    await _player.stop();
    await _player.play(AssetSource('sounds/beep.wav'), volume: 0.6);
  }
}
