import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    this.onTap,
    this.buttonName
  });
  final void Function()? onTap;
  final String? buttonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kbottomColor,
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        margin: const EdgeInsets.only(top: 10.0),
        child:  Center(
          child: Text(
           buttonName ?? 'Default Text',
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
