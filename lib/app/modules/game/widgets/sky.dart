import 'package:flappybird/app/modules/game/game_controller.dart';
import 'package:flappybird/app/modules/game/widgets/bird_widget.dart';
import 'package:flappybird/app/modules/game/widgets/game_over_widget.dart';
import 'package:flappybird/app/modules/game/widgets/pipe_widget.dart';
import 'package:flappybird/app/modules/game/widgets/score.dart';
import 'package:flappybird/app/modules/game/widgets/tap_to_start_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sky extends StatelessWidget {
  const Sky({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sky.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder<GameController>(builder: (controller) {
          return InkWell(
            onTap: controller.onTapSky,
            child: Stack(
              children: [
                BirdWidget(
                  bird: controller.bird,
                ),
                ...controller.pipes.map((e) => PipeWidget(pipe: e)),
                Score(score: controller.score),
                if (controller.gameState == GameState.ready) TapToStartWidget(),
                if (controller.gameState == GameState.over)
                  GameOverWidget(
                    highestScore: 10,
                    score: controller.score,
                    onReplay: controller.onReplay,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
