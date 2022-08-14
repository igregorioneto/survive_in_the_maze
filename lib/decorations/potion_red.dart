import 'package:bonfire/bonfire.dart';
import 'package:survive_in_the_maze/decorations/decoration_sprite_sheet.dart';
import 'package:survive_in_the_maze/person/person.dart';

class PotionRed extends GameDecoration with Sensor {
  PotionRed(Vector2 position)
      : super.withSprite(
          sprite: DecorationSpriteSheet.potionRed,
          position: position,
          size: Vector2(30, 30),
        );

  @override
  void onContact(GameComponent component) {
    if (component is Person) {
      (component).addLife(20);
      removeFromParent();
    }
  }
}
