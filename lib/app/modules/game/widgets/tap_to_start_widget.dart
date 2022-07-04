import 'package:flutter/material.dart';
import 'package:simple_animations/stateless_animation/loop_animation.dart';

class TapToStartWidget extends StatelessWidget {
  const TapToStartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.7),
      child: LoopAnimation(
        duration: const Duration(milliseconds: 600),
        tween: Tween<double>(begin: 1, end: 1.2),
        builder: (ctx, child, double value) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/tap-screen.png',
                width: 60 * value,
              ),
              const SizedBox(height: 20),
              Text(
                'Tap to start',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20 * value,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
