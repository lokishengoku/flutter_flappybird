import 'dart:math';

import 'package:flappybird/app/data/models/pipe.dart';
import 'package:flappybird/app/data/utils/constants.dart';

class PipeBuilder {
  static final _random = Random();

  static Pipe build(int space, double x) {
    final flexTop = random(Constants.limitPipeFlex,
        Constants.totalPipeFlex - space - Constants.limitPipeFlex);
    final flexBottom = Constants.totalPipeFlex - space - flexTop;
    final yTop = flexTop * 2 / Constants.totalPipeFlex - 1;
    final yBottom = (flexTop + space) * 2 / Constants.totalPipeFlex - 1;

    return Pipe(
      x: x,
      space: space,
      yTop: yTop,
      yBottom: yBottom,
      flexTop: flexTop,
      flexBottom: flexBottom,
    );
  }

  static int random(int min, int max) => min + _random.nextInt(max - min);
}
