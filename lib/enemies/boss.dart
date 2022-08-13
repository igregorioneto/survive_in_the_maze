import 'package:bonfire/bonfire.dart';
import 'package:survive_in_the_maze/enemies/enemy_sprite_sheet.dart';

class Boss extends SimpleEnemy with ObjectCollision {
  final Vector2 initPosition;
  double attack = 25;

  Boss(this.initPosition)
      : super(
          position: initPosition,
          size: Vector2(32, 32),
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
}
