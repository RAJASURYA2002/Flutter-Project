import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ReusableCard({required this.colour, this.cardChild,this.onPress});

  final Color colour;
  final Widget? cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, 
            borderRadius: BorderRadius.circular(10.0)),
        // height: 200.0,
        // width: 170.0,
        child: cardChild,
      ),
    );
  }
}
