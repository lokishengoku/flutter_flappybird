import 'package:flappybird/app/data/utils/constants.dart';

class Accelerator {
  static getMovement(double currentY, double time) {
    return currentY - (-Constants.G * time * time / 2 + Constants.V * time);
  }
}
