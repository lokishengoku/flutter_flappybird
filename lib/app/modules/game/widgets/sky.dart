import 'package:flappybird/app/modules/game/game_controller.dart';
import 'package:flappybird/app/modules/game/widgets/bird_widget.dart';
import 'package:flappybird/app/modules/game/widgets/pipe_widget.dart';
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
              ],
            ),
          );
        }),
      ),
    );
  }
}
