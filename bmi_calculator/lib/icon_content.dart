import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key, required this.iconType, required this.genderType});
  final IconData iconType;
  final String genderType;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconType,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          genderType,
          style: klabelTextStyle,
        )
      ],
    );
  }
}
