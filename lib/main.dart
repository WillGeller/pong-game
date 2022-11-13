// @dart=2.9
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:superpong/pong_game.dart';
import 'package:superpong/state/settings.dart';
import 'package:superpong/widgets/widgets.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<SettingsStore>(SettingsStore());

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
