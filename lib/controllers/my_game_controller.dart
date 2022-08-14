import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:survive_in_the_maze/starter.dart';

class MyGameController extends GameComponent {
  bool game = false;
  bool gameOver = false;
  final int stage;

  MyGameController(this.stage);

  @override
  void update(double dt) {
    if (checkInterval('game', 500, dt)) {
      if (gameRef.livingEnemies().isEmpty && !game) {
        game = true;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text("Parabéns, você venceu!"),
                actions: [
                  TextButton(
                    onPressed: () => _restartGame(stage),
                    child: const Text('Restartar o jogo!'),
                  ),
                ],
              );
            });
      }
    }

    if (checkInterval('gameover', 500, dt)) {
      if (gameRef.player?.isDead == true && !gameOver) {
        gameOver = true;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text("GAME OVER"),
                actions: [
                  TextButton(
                    onPressed: () => _restartGame(stage),
                    child: const Text('Restartar o jogo!'),
                  ),
                ],
              );
            });
      }
    }

    super.update(dt);
  }

  void _restartGame(int restartStage) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return Starter(stage: restartStage);
      }),
      (route) => false,
    );
  }
}
