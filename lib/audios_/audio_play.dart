import 'package:audioplayers/audioplayers.dart';

final player = new AudioCache(fixedPlayer: AudioPlayer());

class AudioPlay {
  AudioPlay(bool audi) {
    //AudioPlayer player_ = AudioPlayer();
    if (audi == true) {
      player.loop('audio/music2.mp3'); // to play music for infinite till paused
    } else if (audi == false) {
      player.fixedPlayer?.stop(); // to stop music
    }
  }
}
