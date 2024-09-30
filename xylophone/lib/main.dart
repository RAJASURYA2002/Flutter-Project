import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:xylophone/button.dart';


void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Buttons(color:Colors.red,audio:'note1.wav'),
              Buttons(color:Colors.orange,audio:'note2.wav'),
              Buttons(color:Colors.yellow,audio:'note3.wav'),
              Buttons(color:Colors.green,audio:'note4.wav'),
              Buttons(color:Colors.lightGreen,audio:'note5.wav'),
              Buttons(color:Colors.blue,audio:'note6.wav'),
              Buttons(color:Color.fromARGB(255, 64, 105, 255),audio:'note7.wav'),
          ],
          )
           
        ),
      ),
    );
  }
}
