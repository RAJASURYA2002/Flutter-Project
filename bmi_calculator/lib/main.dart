import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';
// import 'package:bmi_calculator/results_page.dart';

void main() {
  runApp(const BMICALCULATOR());
}

class BMICALCULATOR extends StatelessWidget {
  const BMICALCULATOR({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Color(0xff0a0d22)),
          scaffoldBackgroundColor: const Color(0xff0a0d22),
          // floatingActionButtonTheme:
          //     const FloatingActionButtonThemeData(backgroundColor: Colors.yellow),
          // textTheme: const TextTheme(
          //   bodyMedium: TextStyle(color: Colors.white),
          // ),
          //The above two values are default in ThemeData.dark()
        ),
        home: const InputPage(),
        // routes: {
        //   '/result': (context) => ResultsPage(),
        //   '/input_page': (context) =>const InputPage(),
        // }
        );
  }
}
