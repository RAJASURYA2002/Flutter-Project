import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true)
  ];
  void nextQuestion(BuildContext context) {
    _questionNumber++;
  }

  bool isFinished() {
    // print(_questionNumber);
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }

  String getquestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getquestionBool() {
    return _questionBank[_questionNumber].answer;
  }
}

//_ Private