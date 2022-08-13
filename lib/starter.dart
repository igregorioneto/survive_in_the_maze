import 'package:bonfire/bonfire.dart';
import 'package:bonfire/tiled/model/tiled_object_properties.dart';
import 'package:flutter/material.dart';
import 'package:survive_in_the_maze/enemies/boss.dart';
import 'package:survive_in_the_maze/person/person.dart';

class Starter extends StatefulWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      map: TiledWorldMap('maps/mapa.json',
          forceTileSize: const Size(32, 32),
          objectsBuilder: {
            'boss': (properties) => Boss(properties.position),
          }),
      player: Person(
        Vector2(2 * 32, 8 * 32),
      ),
    );
  }
}
