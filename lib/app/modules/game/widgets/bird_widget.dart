import 'package:flappybird/app/data/models/bird.dart';
import 'package:flutter/material.dart';

class BirdWidget extends StatelessWidget {
  final Bird bird;
  const BirdWidget({Key? key, required this.bird}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 0),
      alignment: Alignment(0, bird.y),
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(bird.rotate),
        child: Image.asset(
          'assets/images/bird.png',
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
