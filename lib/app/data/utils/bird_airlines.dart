import 'dart:math';

import 'package:flappybird/app/data/utils/constants.dart';

class BirdAirlines {
  static getY(double currentY, double time) {
    return currentY - (-Constants.G * time * time / 2 + Constants.VY * time);
  }

  static getVY(double time) {
    return Constants.VY - Constants.G * time;
  }

  static getRotation(double newBirdY, double lastBirdY, double time) {
    final deg = atan(getVY(time) / Constants.VX);
    return -deg / (2 * pi);
  }
}
