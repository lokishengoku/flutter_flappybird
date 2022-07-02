import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;
  const Score({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 56,
      left: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/coin.png',
            width: 24,
          ),
          const SizedBox(width: 10),
          Text(
            score.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
