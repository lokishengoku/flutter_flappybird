import 'dart:async';

import 'package:flappybird/app/data/models/bird.dart';
import 'package:flappybird/app/data/utils/accelerator.dart';
import 'package:flappybird/app/data/utils/constants.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  final bird = Bird();

  double time = Constants.defaultTime;
  double birdFlyPosition = Constants.defaultY;
  var gameState = GameState.ready;

  @override
  onReady() {
    update();
  }

  startGame() {
    gameState = GameState.playing;
    update();
    Timer.periodic(const Duration(milliseconds: 40), (timer) {
      time += Constants.timeStep;
      bird.y = Accelerator.getMovement(birdFlyPosition, time);
      update();
      if (_gameOver()) {
        print('game over');
        timer.cancel();
        gameState = GameState.over;
        update();
      }
    });
  }

  onTapSky() {
    switch (gameState) {
      case GameState.ready:
      case GameState.over:
        startGame();
        break;
      case GameState.playing:
        _fly();
        break;
    }
  }

  _fly() {
    time = Constants.defaultTime;
    birdFlyPosition = bird.y;
    update();
  }

  _gameOver() {
    return bird.y >= 0.9;
  }
}

enum GameState { ready, playing, over }
