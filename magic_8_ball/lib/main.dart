import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue[500],
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Center(
              child: Text(
                "Ask Me Anything",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: const MagicBall(),
        ),
      ),
    ),
  );
}

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int randomNumber = 1;
  void ball() {
    randomNumber = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          ball();
        });
      },
      child: Center(
        child: Image(
          image: AssetImage('images/ball$randomNumber.png'),
        ),
      ),
    );
  }
}
