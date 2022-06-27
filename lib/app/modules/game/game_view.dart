import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'game_controller.dart';
import 'widgets/ground.dart';
import 'widgets/sky.dart';

class GameView extends GetView<GameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: [
          Sky(),
          Ground(),
        ],
      ),
    );
  }
}
