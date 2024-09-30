import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:cool_alert/cool_alert.dart';

QuizBrain question = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Center(
            child: Text(
              "QUIZZLER",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  // List<bool> answers = [false, true, true];
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool answer, BuildContext context) {
    setState(() {
      if (question.isFinished() == true) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: 'Congratulations!',
          text: 'You have completed the quiz successfully.',
          loopAnimation: false,
        );
        question.reset();
        scoreKeeper = [];
      } else {
        if (question.getquestionBool() == answer) {
          // print("Correct");
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          // print("Wrong");
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        question.nextQuestion(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                question.getquestionText(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 27.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //  mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    //TRUE
                    checkAnswer(true, context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: const Size(double.infinity, 70.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Text(
                    "TRUE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    //FALSE
                    checkAnswer(false, context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(double.infinity, 70.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Text(
                    "FALSE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}

// questionl: 'You can lead a cow down stairs but not up stairs.' false,
// question2: 'Approximately one quarter of human bones are in the feet.'true,
// question3: 'A slug\'s blood is green.'true,
