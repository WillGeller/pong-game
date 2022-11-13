// settings.dart
import 'package:flame_audio/flame_audio.dart';
import 'package:mobx/mobx.dart';

part 'settings.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  /* rest of the class*/
  @observable
  bool isBgMusicPlaying = false;

  @computed
  String get toggleMusicButtonTxt =>
      '${isBgMusicPlaying ? 'Mute' : 'Un-Mute'} Music';

  @action
  Future<void> initMusic() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.bgm.play('music/bg_music.ogg');
    isBgMusicPlaying = true;
  }

  @action
  Future<void> pauseMusic() async {
    await FlameAudio.bgm.pause();
    isBgMusicPlaying = false;
  }

  @action
  Future<void> resumeMusic() async {
    await FlameAudio.bgm.resume();
    isBgMusicPlaying = true;
  }

  @action
  void toggleMusic() {
    isBgMusicPlaying ? pauseMusic() : resumeMusic();
  }
}
