import 'package:flappybird/app/data/utils/constants.dart';

class Bird {
  double y = Constants.defaultY;
  double rotate = Constants.defaultRotate;

  void reset() {
    y = Constants.defaultY;
    rotate = Constants.defaultRotate;
  }
}
