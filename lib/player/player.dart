import 'package:bonfire/bonfire.dart';
import 'package:bonfire/collision/object_collision.dart';
import 'package:bonfire/joystick/joystick_controller.dart';
import 'package:bonfire/npc/ally/simple_ally.dart';
import 'package:bonfire/player/simple_player.dart';
import 'package:flutter/rendering.dart';
import 'package:survive_in_the_maze/player/player_sprite.dart';

const double tileSize = 32;

class PlayerGame extends SimplePlayer with ObjectCollision, JoystickListener {
  PlayerGame()
      : super(
          position: Vector2(
            tileSize * 5,
            tileSize * 5,
          ),
          size: Vector2(
            tileSize,
            tileSize,
          ),
          animation: SimpleDirectionAnimation(
            idleRight: PlayerSprite.idleRight,
            runRight: PlayerSprite.idleRight,
            idleLeft: PlayerSprite.idleLeft,
            runLeft: PlayerSprite.idleLeft,
            runUp: PlayerSprite.idleUp,
            runDown: PlayerSprite.idleDown,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 20),
            align: Vector2(6, 15),
          ),
        ],
      ),
    );
  }
}
