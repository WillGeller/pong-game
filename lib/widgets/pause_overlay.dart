// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:superpong/components/components.dart';
import 'package:superpong/pong_game.dart';
import 'package:superpong/state/settings.dart';

class PauseOverlay extends StatefulWidget {
  const PauseOverlay({super.key, required this.game, required this.settings});

  final PongGame game;
  final SettingsStore settings;

  @override
  PauseOverlayState createState() => PauseOverlayState();
}

class PauseOverlayState extends State<PauseOverlay> {
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
              onPressed: widget.game.reset,
              style: _buttonStyle,
              child: const Text('Restart Game'),
            ),
            const SizedBox(height: Field.width),
            OutlinedButton(
                key: const Key('toogleAudioButton'),
                onPressed: widget.settings.toggleMusic,
                style: _buttonStyle,
                child: Observer(
                    builder: (_) =>
                        Text(widget.settings.toggleMusicButtonTxt))),
          ],
        ),
      ),
    );
  }
}
