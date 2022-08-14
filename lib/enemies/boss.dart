import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:survive_in_the_maze/enemies/enemy_sprite_sheet.dart';

class Boss extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement {
  final Vector2 initPosition;
  double attack = 25;

  Boss(this.initPosition)
      : super(
          position: initPosition,
          size: Vector2(32, 32),
          speed: 20,
          animation: SimpleDirectionAnimation(
            idleRight: EnemySpriteSheet.idleRight,
            runRight: EnemySpriteSheet.runRight,
            idleLeft: EnemySpriteSheet.idleLeft,
            runLeft: EnemySpriteSheet.runLeft,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 16),
            align: Vector2(8, 13),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    seePlayer(observed: (person) {
      seeAndMoveToPlayer(
        closePlayer: (person) {
          simpleAttackMelee(
            damage: 20,
            size: Vector2(22, 22),
          );
        },
        radiusVision: 32 * 3,
        margin: 4,
      );
    }, notObserved: () {
      runRandomMovement(
        dt,
        speed: 20,
        timeKeepStopped: 1,
      );
    });

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 2,
      height: 2,
      align: const Offset(0, -5),
    );
    super.render(canvas);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
