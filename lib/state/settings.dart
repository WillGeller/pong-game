// settings.dart
import 'package:flame_audio/flame_audio.dart';
import 'package:mobx/mobx.dart';

part 'settings.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  /* rest of the class*/
  @observable
  bool isBgMusicPlaying = true;

  @computed
  String get toggleMusicButtonTxt =>
      'Turn ${isBgMusicPlaying ? 'off' : 'on'} music';

  @action
  void initMusic() {
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('music/bg_music.ogg');
    isBgMusicPlaying = true;
  }

  @action
  void pauseMusic() {
    FlameAudio.bgm.pause();
    isBgMusicPlaying = false;
  }

  @action
  void resumeMusic() {
    FlameAudio.bgm.resume();
    isBgMusicPlaying = true;
  }

  @action
  void toggleMusic() {
    isBgMusicPlaying ? pauseMusic() : resumeMusic();
  }
}
