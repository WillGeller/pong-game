import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:superpong/components/components.dart';
import 'package:superpong/pong_game.dart';

/// {@template score}
/// A component that displays the score.
/// {@endtemplate}
class Score extends PositionComponent with HasGameRef {
  /// {@macro score}
  Score.left()
      : _textPaint = TextPaint(textDirection: TextDirection.ltr),
        super(anchor: Anchor.center);

  /// {@macro score}
  Score.right()
      : _textPaint = TextPaint(textDirection: TextDirection.rtl),
        super(anchor: Anchor.center);

  final TextPaint _textPaint;

  /// The current score.
  int score = 0;

  @override
  void onGameResize(Vector2 size) {
    position.setValues(
      (gameRef.size / 2).x +
          (_textPaint.textDirection == TextDirection.ltr ? 1 : -1) * 24,
      Field.width * 3,
    );
    super.onGameResize(size);
  }

  @override
  void render(Canvas canvas) {
    _textPaint.render(canvas,
        PongGame.settingsStore.isBgMusicPlaying.toString(), Vector2.zero(),
        anchor: anchor);
  }
}
