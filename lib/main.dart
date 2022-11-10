// @dart=2.9
import 'package:flame/game.dart';
import 'package:superpong/pong_game.dart';
import 'package:superpong/widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(
      game: PongGame(),
      initialActiveOverlays: const ['start'],
      overlayBuilderMap: {
        'start': (context, PongGame game) => StartOverlay(game: game),
        'pause': (context, PongGame game) => PauseOverlay(game: game),
      },
    ),
  );
}
