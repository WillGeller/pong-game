import 'package:flame_audio/flame_audio.dart';
import 'package:superpong/components/components.dart';
import 'package:superpong/pong_game.dart';
import 'package:flutter/material.dart';

/// {@template pause_overlay}
/// The pause overlay is shown when the game is is paused,
/// it allows reseting the game and contolling settings
/// {@endtemplate}
class PauseOverlay extends StatelessWidget {
  /// {@macro Pause_overlay}
  const PauseOverlay({
    super.key,
    required this.game,
  });

  static final _buttonStyle = ButtonStyle(
    side: MaterialStateProperty.all(
      const BorderSide(
        color: Colors.white,
        width: Field.halfWidth / 2,
      ),
    ),
    foregroundColor: MaterialStateProperty.all(
      Colors.white,
    ),
    backgroundColor: MaterialStateProperty.all(
      Field.backgroundColor,
    ),
    overlayColor: MaterialStateProperty.all(
      Colors.white.withOpacity(0.1),
    ),
  );

  /// The game that this overlay belongs to.
  final PongGame game;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Field.backgroundColor,
          border: Border.all(color: Colors.white, width: Field.halfWidth),
        ),
        width: 256,
        padding: const EdgeInsets.all(Field.width),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'PAUSED',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            const SizedBox(height: Field.width),
            OutlinedButton(
              key: const Key('resetButton'),
              onPressed: game.reset,
              style: _buttonStyle,
              child: const Text('Restart Game'),
            ),
            const SizedBox(height: Field.width),
            OutlinedButton(
              key: const Key('settingsButton'),
              onPressed: () => FlameAudio.bgm.audioPlayer.setVolume(0),
              style: _buttonStyle,
              child: const Text('Mute Audio'),
            ),
          ],
        ),
      ),
    );
  }
}
