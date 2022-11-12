import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:superpong/entities/entities.dart';
import 'package:superpong/pong_game.dart';

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
      gameRef.playerOneScore!.score++;
    } else if (hitRight) {
      gameRef.playerTwoScore!.score++;
    } else {
      return;
    }

    FlameAudio.play('sfx/fire_2.mp3');

    if (parent != parent.parent!.children.query<Ball>().first) {
      parent.parent!.remove(parent);
    } else {
      parent.reset();
    }
  }
}
