import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
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
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Tente novamente!"),
          );
        });
    super.die();
  }
}
