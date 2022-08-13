import 'package:bonfire/bonfire.dart';

class EnemySpriteSheet {
  static get idleRight => SpriteAnimation.load(
        'enemy/mini_boss_idle.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static get runRight => SpriteAnimation.load(
        'enemy/mini_boss_run_right.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static get idleLeft => SpriteAnimation.load(
        'enemy/mini_boss_idle_left.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static get runLeft => SpriteAnimation.load(
        'enemy/mini_boss_run_left.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
}
