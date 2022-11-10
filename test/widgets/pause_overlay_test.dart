import 'package:superpong/pong_game.dart';
import 'package:superpong/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/helpers.dart';

class _MockPongGame extends Mock implements PongGame {}

void main() {
  group('PauseOverlay', () {
    late PongGame pongGame;

    setUp(() {
      pongGame = _MockPongGame();

      registerFallbackValue(GameMode.computerVsComputer);
    });

    testWidgets('renders correctly', (tester) async {
      await tester.pumpApp(PauseOverlay(game: pongGame));

      expect(find.byType(OutlinedButton), findsNWidgets(1));
      expect(find.byType(Text), findsNWidgets(2));
    });

    testWidgets('Reses Game', (tester) async {
      await tester.pumpApp(PauseOverlay(game: pongGame));

      when(() => pongGame.reset()).thenAnswer((invocation) => Future.value());

      await tester.tap(find.byKey(const Key('resetButton')));

      verify(() => pongGame.reset()).called(1);
    });
  });
}
