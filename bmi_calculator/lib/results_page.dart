import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key,@required this.bmicalculateBMI,@required this.getResult,@required this.getInterpretation});
  final String? bmicalculateBMI;
  final String? getResult;
  final String? getInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 10.0),
              child: const Text(
                "Your Result",
                style: kExtraLergeTextStyle,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(70.0),
                color: const Color(0xff1d1f33),
                child: Column(
                  children: [
                    Text(getResult!, style: kNormal),
                    Text(
                      bmicalculateBMI!,
                      style: kExtraBigNumber,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      "Normal BMI Range",
                      style: kResultTextStyle,
                    ),
                    const Text(
                      "18,5 - 25 kg/m2",
                      style: kSmallResultTextStyle,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      getInterpretation!,
                      textAlign: TextAlign.center,
                      style: kSmallResultTextStyle,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: 250.0,
                      height: 70.0,
                      decoration: const BoxDecoration(color: Color(0xff181a2e)),
                      child: const Center(
                          child: Text(
                        "SAVE RESULT",
                        style: kSmallResultTextStyle,
                      )),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputPage(),
                  ),
                );
              },
              buttonName: "RE-CALCULATE YOUR BMI",
            )
          ],
        ),
      ),
    );
  }
}
