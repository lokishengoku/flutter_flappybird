import 'package:flutter/material.dart';

class Ground extends StatelessWidget {
  const Ground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/ground.jpeg'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
      ),
      width: double.infinity,
      height: 50,
    );
  }
}
