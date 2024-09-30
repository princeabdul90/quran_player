/*
* Developer: Abubakar Abdullahi
* Date: 23/09/2024
*/

import 'package:just_audio/just_audio.dart';

class PlayerRepository {
  final AudioPlayer _player = AudioPlayer();

  Future<void> init() async {

    // set loop mode
    _player.setLoopMode(LoopMode.values[1]);

    // subscribe to changes in playback state to add to the recently played
    _player.playbackEventStream.listen((event) {
      if(event.currentIndex != null){}
    },);
  }

  Future<void> load(url)  async {

    await _player.setAudioSource(AudioSource.uri(Uri.parse(url)));

    // List<AudioSource> sources = [];
    //
    // sources.add(
    //   AudioSource.uri(Uri.parse(""))
    // );
  }

  // Play
  Future<void> play() => _player.play();

  // Stop
  Future<void> stop() => _player.stop();

  // Pause
  Future<void> pause() => _player.pause();


  // Next
  Future<void> seekToNext() => _player.seekToNext();

  // Previous
  Future<void> seekToPrev() => _player.seekToPrevious();

  // Seek Position
  Future<void> seek(Duration position, {int? index}) async {
    if(index != null){
      await _player.seek(position, index: index);
    }else{
      await _player.seek(position);
    }
  }

  // Playing
  Stream<bool> get playing => _player.playingStream;

  // dispose
  Future<void> dispose() async => await _player.dispose();



}