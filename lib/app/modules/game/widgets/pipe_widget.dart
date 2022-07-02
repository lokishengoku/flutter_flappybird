import 'dart:math';

import 'package:flappybird/app/data/models/pipe.dart';
import 'package:flappybird/app/data/utils/constants.dart';
import 'package:flutter/material.dart';

class PipeWidget extends StatelessWidget {
  final Pipe pipe;
  const PipeWidget({Key? key, required this.pipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 0),
      alignment: Alignment(pipe.x, 0),
      child: Column(
        children: [
          _topPipe(),
          Expanded(
            flex: pipe.space,
            child: Container(
              width: Constants.pipeW,
              color: Colors.transparent,
            ),
          ),
          _bottomPipe(),
        ],
      ),
    );
  }

  Expanded _topPipe() {
    return Expanded(
      flex: pipe.flexTop,
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: Image.asset(
                'assets/images/pipe-body.png',
                width: Constants.pipeW,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Transform.rotate(
            angle: -pi,
            child: Image.asset(
              'assets/images/pipe-head.png',
              width: Constants.pipeW * 1.1,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

  Expanded _bottomPipe() {
    return Expanded(
      flex: pipe.flexBottom,
      child: Column(
        children: [
          Image.asset(
            'assets/images/pipe-head.png',
            width: Constants.pipeW * 1.1,
            fit: BoxFit.fitWidth,
          ),
          Expanded(
            child: Image.asset(
              'assets/images/pipe-body.png',
              width: Constants.pipeW,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
