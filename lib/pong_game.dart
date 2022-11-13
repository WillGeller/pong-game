// ignore_for_file: public_member_api_docs, import_of_legacy_library_into_null_safe

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_gamepad/flame_gamepad.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superpong/components/components.dart';
import 'package:superpong/entities/entities.dart';
import 'package:superpong/state/settings.dart';

/// The game mode that the game is in.
enum GameMode {
  /// Player vs. player mode.
  playerVsPlayer,

  /// Player vs. Computer mode.
  playerVsComputer,

  /// Computer vs. Computer mode.
  computerVsComputer,
}

/// An example Flame game built with Flame Behaviors.
class PongGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  PongGame({required this.settings});

  final SettingsStore settings;

  static final paint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  /// Score of the left player.
  Score? playerOneScore;

  /// Score of the right player.
  Score? playerTwoScore;

  @override
  Future<void> onLoad() async {
    // Set the viewport to the original game's size.
    camera.viewport = FixedResolutionViewport(Vector2(512, 256));
    final Ball ball;

    await settings.initMusic();

    await addAll([
      // Draw the field on the screen.
      Field(),
      // Spawn a ball.
      ball = Ball(),
      // Create score components.
      playerOneScore = Score.left(),
      playerTwoScore = Score.right(),
      // Add a FPS counter if in debug mode.
      if (kDebugMode)
        FpsTextComponent(
          position: Vector2(size.x - Field.halfWidth, size.y - Field.halfWidth),
          anchor: Anchor.bottomRight,
          textRenderer: TextPaint(
            style: const TextStyle(fontSize: Field.width, color: Colors.green),
          ),
        )
    ]);

    ball.reset();

    // Wait until everything is loaded and pause the game.
    await ready();
    paused = true;

    FlameGamepad().setListener((String evtType, String key) {
      if (key == 'START' && evtType == GAMEPAD_BUTTON_DOWN) {
        showPauseMenu();
      }

      if (key == 'A' && evtType == GAMEPAD_BUTTON_DOWN) {
        addBall();
      }
    });
  }

  /// Start the current game.
  Future<void> start(GameMode mode) async {
    if (!paused) {
      return; // Already started.
    }
    overlays.remove('start');
    final center = size / 2;

    switch (mode) {
      case GameMode.playerVsPlayer:
        await addAll([
          Paddle.wasd(center: Vector2(size.x - 16, center.y)),
          Paddle.arrows(center: Vector2(16, center.y)),
        ]);
        break;
      case GameMode.playerVsComputer:
        await addAll([
          Paddle.autonomous(center: Vector2(size.x - 16, center.y)),
          Paddle.arrows(center: Vector2(16, center.y)),
        ]);
        break;
      case GameMode.computerVsComputer:
        await addAll([
          Paddle.autonomous(center: Vector2(16, center.y)),
          Paddle.autonomous(center: Vector2(size.x - 16, center.y)),
        ]);
        break;
    }

    // Wait until everything is loaded and unpause the game.
    await ready();
    paused = false;
  }

  /// Reset the game to the start sceen.
  Future<void> reset() async {
    overlays
      ..remove('pause')
      ..add('start');

    removeAll(children.query<Paddle>());
    playerOneScore!.score = 0;
    playerTwoScore!.score = 0;

    children.query<Ball>().forEach((ball) {
      if (ball == children.query<Ball>().first) {
        ball.reset();
      } else {
        remove(ball);
      }
    });
  }

  @override
  @mustCallSuper
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    super.onKeyEvent(event, keysPressed);

    if (keysPressed.contains(LogicalKeyboardKey.escape)) {
      showPauseMenu();
    }

    if (keysPressed.contains(LogicalKeyboardKey.space)) {
      addBall();
    }

    // Return handled to prevent macOS noises.
    return KeyEventResult.handled;
  }

  /// Show the pause overlay
  void showPauseMenu() {
    // Don't allow pause menu from start menu
    if (overlays.isActive('start')) {
      return;
    }

    paused = !paused;

    if (paused) {
      overlays.add('pause');
    } else {
      overlays.remove('pause');
    }
  }

  /// Adds another ball!
  Future<void> addBall() async {
    final Ball ball;

    await add(ball = Ball());

    ball.reset();
  }
}
