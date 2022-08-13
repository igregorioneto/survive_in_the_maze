import 'package:bonfire/bonfire.dart';

class PersonSpriteSheet {
  static get idleRight => SpriteAnimation.load(
        'player/knight_idle.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static get runRight => SpriteAnimation.load(
        'player/knight_run.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static get idleLeft => SpriteAnimation.load(
        'player/knight_idle_left.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static get runLeft => SpriteAnimation.load(
        'player/knight_run_left.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
}
