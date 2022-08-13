import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:survive_in_the_maze/enemies/enemy_sprite_sheet.dart';

class Boss extends SimpleEnemy with ObjectCollision {
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
    simpleAttackMelee(
      damage: 100,
      size: Vector2(32, 32),
    );

    seeAndMoveToPlayer(
      closePlayer: (person) {},
      radiusVision: 32 * 2,
      margin: 4,
    );
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
