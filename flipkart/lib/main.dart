import 'package:flipkart/Pages/HomePage/home.dart';
import 'package:flipkart/Pages/languages.dart';
import 'package:flipkart/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  await Hive.initFlutter();
  await Hive.openBox('userdata');
  final localData = Hive.box('userdata');
  if (localData.get("Login") != true) {
    localData.put("Login", false);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final localData = Hive.box('userdata');
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(PageTransition(
          child: localData.get("Login") == false
              ? LanguagesScreen()
              : HomeScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          duration: Duration(seconds: 1)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff1b1b1b),
        body: Center(
          child: Container(
            child: Image.asset(
              'assets/App_intro/flipkart_intro.png',
              width: 90,
              height: 90,
            ),
          ),
        ),
      ),
    );
  }
}
