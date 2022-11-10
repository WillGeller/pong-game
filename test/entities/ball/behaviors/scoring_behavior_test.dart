// ignore_for_file: cascade_invocations

import 'package:flame/extensions.dart';
import 'package:superpong/entities/ball/behaviors/behaviors.dart';
import 'package:superpong/entities/entities.dart';
import 'package:superpong/pong_game.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final flameTester = FlameTester<PongGame>(PongGame.new);

  group('ScoreBehavior', () {
    group('scores a point', () {
      flameTester.test(
        'when hitting the left side',
        (game) async {
          final center = game.size / 2;
          final behavior = ScoringBehavior();

          final ball = Ball.test(
            behavior: behavior,
            velocity: Vector2(-10, 0),
            position: Vector2(0, center.y),
          );
          await game.ensureAdd(ball);

          expect(game.playerOneScore!.score, equals(0));

          game.update(1);

          expect(game.playerOneScore!.score, equals(1));
        },
      );

      flameTester.test(
        'when hitting the right side',
        (game) async {
          final center = game.size / 2;
          final behavior = ScoringBehavior();

          final ball = Ball.test(
            behavior: behavior,
            velocity: Vector2(10, 0),
            position: Vector2(game.size.x, center.y),
          );
          await game.ensureAdd(ball);

          expect(game.playerTwoScore!.score, equals(0));

          game.update(1);

          expect(game.playerTwoScore!.score, equals(1));
        },
      );
    });
  });
}
