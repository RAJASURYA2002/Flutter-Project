import 'package:flashchat/components/rounded_button.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      // upperBound: 100.0,
      vsync: this,
    );
    // animation = CurvedAnimation(parent: controller!, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);
    if (controller != null && mounted) {
      controller?.forward();
      // animation!.addStatusListener((status) {
      //   // if(status==AnimationStatus.completed){
      //   //   controller?.reverse(from: 1.0);
      //   // }
      //   // else if(status==AnimationStatus.dismissed){
      //   //   controller?.forward();
      //   // }
      // });
      controller?.addListener(() {
        setState(() {});
        // print(controller?.value);
      });
    }
    @override
    void dispose() {
      controller!.dispose();
      super.dispose();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  totalRepeatCount: 4,
                  // pause: const Duration(milliseconds: 5000),
                  // style: TextStyle(
                  //   color: Colors.grey,
                  //   fontSize: 45.0,
                  //   fontWeight: FontWeight.w900,
                  // ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              buttonTitle: "Log In",
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              buttonTitle: "Register",
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
//Login Colors.lightBlueAccent
//registration Colors.blueAccent
//  () {
//             //Go to login screen.
//             Navigator.pushNamed(context, LoginScreen.id);
//           },