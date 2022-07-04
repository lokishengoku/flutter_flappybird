import 'dart:async';

import 'package:flappybird/app/data/models/bird.dart';
import 'package:flappybird/app/data/models/pipe.dart';
import 'package:flappybird/app/data/utils/bird_airlines.dart';
import 'package:flappybird/app/data/utils/constants.dart';
import 'package:flappybird/app/data/utils/pipe_builder.dart';
import 'package:flappybird/app/data/utils/screen_info.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  var time = Constants.defaultTime;
  var birdFlyPosition = Constants.defaultY;
  var gameState = GameState.ready;
  var score = 0;
  var difficultyPipesSpace = Constants.defaultDifficultySpace;
  final rightPipeX = ScreenInfo.percentOfWidth(Constants.pipeW) * 2 * 0.95;
  final leftPipeX = -ScreenInfo.percentOfWidth(Constants.pipeW) * 2 * 0.95;
  final bird = Bird();
  final List<Pipe> pipes = [];

  @override
  void onReady() {
    _initGame();
    super.onReady();
  }

  startGame() {
    gameState = GameState.playing;
    update();
    Timer.periodic(const Duration(milliseconds: 20), (timer) {
      _moveObjects();
      if (_gameOver()) {
        gameState = GameState.over;
        update();
        timer.cancel();
      }
    });
  }

  _initGame() {
    gameState = GameState.ready;
    score = 0;
    time = Constants.defaultTime;
    birdFlyPosition = Constants.defaultY;
    difficultyPipesSpace = Constants.defaultDifficultySpace;
    bird.reset();
    pipes.clear();
    pipes.addAll([
      PipeBuilder.build(difficultyPipesSpace, Constants.startPipeX),
      PipeBuilder.build(
          difficultyPipesSpace, Constants.startPipeX + Constants.pipesSpace),
      PipeBuilder.build(difficultyPipesSpace,
          Constants.startPipeX + Constants.pipesSpace * 2),
      PipeBuilder.build(difficultyPipesSpace,
          Constants.startPipeX + Constants.pipesSpace * 3),
    ]);
    update();
  }

  onTapSky() {
    switch (gameState) {
      case GameState.ready:
        startGame();
        break;
      case GameState.over:
        break;
      case GameState.playing:
        _fly();
        break;
    }
  }

  onReplay() {
    _initGame();
  }

  _moveObjects() {
    time += Constants.timeStep;

    // move bird
    final lastY = bird.y;
    bird.y = BirdAirlines.getY(birdFlyPosition, time);
    bird.rotate = BirdAirlines.getRotation(bird.y, lastY, time);

    // move pipes
    for (int i = 0; i < pipes.length; i++) {
      final previousPipe = pipes[i == 0 ? pipes.length - 1 : i - 1];
      final oldPipePos = pipes[i].x;
      pipes[i].x -= Constants.pipeStep;

      if (oldPipePos > 0 && pipes[i].x < 0) score++;

      if (pipes[i].x <= Constants.insertPipeX) {
        pipes[i].x = previousPipe.x + Constants.pipesSpace;
      }
    }

    update();
  }

  _fly() {
    time = Constants.defaultTime;
    birdFlyPosition = bird.y;
    update();
  }

  _gameOver() {
    final topBirdY = bird.y - ScreenInfo.percentOfHeight(Constants.birdH) * 0.9;
    final bottomBirdY =
        bird.y + ScreenInfo.percentOfHeight(Constants.birdH) * 0.9;

    // Bird touches ground
    if (bottomBirdY >= 1) return true;

    // Bird touches cloud
    if (topBirdY <= -1) return true;

    // Bird touches pipe
    final midPipe = pipes.firstWhereOrNull(
        (pipe) => pipe.x >= leftPipeX && pipe.x <= rightPipeX);
    if (midPipe != null) {
      // print('${bird.y} | $bottomBirdY | ${midPipe.yTop} | ${midPipe.yBottom}');
      // Bird touches bottom pipe
      if (bottomBirdY >= midPipe.yBottom) return true;
      // Bird touches top pipe
      if (topBirdY <= midPipe.yTop) return true;
    }
    return false;
  }
}

enum GameState { ready, playing, over }
