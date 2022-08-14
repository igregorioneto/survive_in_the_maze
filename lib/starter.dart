import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:survive_in_the_maze/controllers/my_game_controller.dart';
import 'package:survive_in_the_maze/decorations/potion_red.dart';
import 'package:survive_in_the_maze/enemies/boss.dart';
import 'package:survive_in_the_maze/interface/person_interface.dart';
import 'package:survive_in_the_maze/person/person.dart';

class Starter extends StatefulWidget {
  final int stage;
  const Starter({Key? key, this.stage = 1}) : super(key: key);

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> implements GameListener {
  late GameController controller;
  @override
  void initState() {
    controller = GameController()..addListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      gameController: controller,
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      map: TiledWorldMap('maps/mapa.json',
          forceTileSize: const Size(32, 32),
          objectsBuilder: {
            'boss': (properties) => Boss(properties.position),
            'potionRed': (properties) => PotionRed(properties.position),
          }),
      player: Person(
        Vector2(2 * 32, 8 * 32),
      ),
      overlayBuilderMap: {
        'playerInterface': (context, game) => PersonInterface(
              game: game,
            ),
      },
      components: [
        MyGameController(widget.stage),
      ],
    );
  }

  @override
  void changeCountLiveEnemies(int count) {
    if (count == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Parabéns, você venceu!"),
            );
          });
    }
  }

  @override
  void updateGame() {
    // TODO: implement updateGame
  }
}
