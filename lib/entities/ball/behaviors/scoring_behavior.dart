import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_behaviors_pong_example/entities/entities.dart';
import 'package:flame_behaviors_pong_example/pong_game.dart';

/// {@template scoring_behavior}
/// A behavior that adds a point to the score when the ball hits the other side.
///
/// It also resets the ball to the center of the field.
/// {@endtemplate}
class ScoringBehavior extends Behavior<Ball> with HasGameRef<PongGame> {
  @override
  void update(double dt) {
    final hitLeft = parent.position.x - parent.size.x <= 0;
    final hitRight = parent.position.x >= gameRef.size.x - parent.size.x / 2;

    // If we hit the sides, reset the ball.
    if (hitLeft) {
      FlameAudio.play('sfx/fire_2.mp3');
      gameRef.playerOneScore!.score++;
      parent.reset();
    } else if (hitRight) {
      FlameAudio.play('sfx/fire_2.mp3');
      gameRef.playerTwoScore!.score++;
      parent.reset();
    }
  }
}
