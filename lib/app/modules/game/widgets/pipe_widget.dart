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
          Expanded(
            flex: pipe.flexTop,
            child: Container(
              width: Constants.pipeW,
              color: Colors.green,
            ),
          ),
          Expanded(
            flex: pipe.space,
            child: Container(
              width: Constants.pipeW,
              color: Colors.transparent,
            ),
          ),
          Expanded(
            flex: pipe.flexBottom,
            child: Container(
              width: Constants.pipeW,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
