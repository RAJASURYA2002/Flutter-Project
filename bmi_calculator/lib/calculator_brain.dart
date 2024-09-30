import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int? height;
  final int? weight;
  double _bmi=0.0;

  String bmicalculateBMI() {
    if (height != null && weight != null && height! > 0) {
      _bmi = weight! / pow(height! / 100, 2);
      return _bmi
          .toStringAsFixed(1); // Adjust the number of decimal places as needed
    } else {
      return 'Invalid input'; // Handle the case when height is null or 0
    }
  }

  String getResult() {
    if (_bmi.round() >= 25) {
      return 'Overweight';
    } else if (_bmi.round() > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    bmicalculateBMI(); 
    if (_bmi >= 25) {
      return 'You have the higher than normal body weight.Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a Normal Body weight.Good Job!';
    } else {
      return 'You have lower than normal body weight.Eat More...';
    }
  }
}
