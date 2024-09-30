import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Buttons extends StatelessWidget {
  final Color color;
  final String audio;
  const Buttons({super.key, required this.color,required this.audio});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
          onPressed: () {
            final player = AudioPlayer();
            player.play(AssetSource(audio));
          },
          style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0), // Set the radius to zero
            ),
          ),
          child: const Text(""),
        ),
      );
  }
}
