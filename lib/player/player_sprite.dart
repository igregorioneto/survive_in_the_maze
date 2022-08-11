import 'package:bonfire/bonfire.dart';

class PlayerSprite {
  static Future<SpriteAnimation> _sequenceImage(
    String fileName, {
    int amount = 6,
    double position_x = 0,
    double position_y = 0,
  }) {
    return SpriteAnimation.load(
      'player/$fileName',
      SpriteAnimationData.sequenced(
          amount: amount,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(position_x, position_y)),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _sequenceImage('player.png', position_x: 0, position_y: 48);

  static Future<SpriteAnimation> get idleRight =>
      _sequenceImage('player.png', position_x: 0, position_y: 32);

  static Future<SpriteAnimation> get idleUp =>
      _sequenceImage('player.png', position_x: 0, position_y: 16);

  static Future<SpriteAnimation> get idleDown =>
      _sequenceImage('player.png', position_x: 0, position_y: 0);
}
