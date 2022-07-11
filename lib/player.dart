
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:jeu_test/main.dart';

class Player extends SpriteComponent with HasGameRef<SpaceShooterGame>{

  @override
  Future<void> onLoad()async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('chara_3_pikachu_01.png');
    position = gameRef.size / 2;
    width = 99;
    height = 128;
    anchor = Anchor.center;
  }

  void move(Vector2 delta){
    position.add(delta);
  }
}

