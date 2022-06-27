import 'package:flutter/material.dart';

class Ground extends StatelessWidget {
  const Ground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.brown[300],
      ),
    );
  }
}
