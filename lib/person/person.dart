import 'package:bonfire/bonfire.dart';
import 'package:survive_in_the_maze/person/person_sprite_sheet.dart';

class Person extends SimplePlayer with ObjectCollision {
  Person(Vector2 position)
      : super(
          position: position,
          size: Vector2(32, 32),
          animation: SimpleDirectionAnimation(
            idleRight: PersonSpriteSheet.idleRight,
            runRight: PersonSpriteSheet.runRight,
            idleLeft: PersonSpriteSheet.idleLeft,
            runLeft: PersonSpriteSheet.runLeft,
          ),
        ) {
    setupCollision(
      CollisionConfig(collisions: [
        CollisionArea.rectangle(
          size: Vector2(20, 16),
          align: Vector2(8, 13),
        ),
      ]),
    );
  }
}
