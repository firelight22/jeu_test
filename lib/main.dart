
import 'dart:io';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';

import 'player.dart';



class SpaceShooterGame extends FlameGame with PanDetector,KeyboardEvents{
  late Player player;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    player = Player();
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.game);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event,
      Set<LogicalKeyboardKey> keysPressed,
      ) {
    final isKeyDown = event is RawKeyDownEvent;


    if (isKeyDown) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        player.move(Vector2(-5,0));
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        player.move(Vector2(5,0));
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
        player.move(Vector2(0,-5));
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
        player.move(Vector2(0,5));
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyJ)) {
        for(var i =0; i< 100;i++){
          player.move(Vector2(0, 1));
        }
        for(var i =0; i< 100;i++){
          player.move(Vector2(0, -1));
        }
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

}

void main() {
  runApp(GameWidget(game: SpaceShooterGame()));
}

