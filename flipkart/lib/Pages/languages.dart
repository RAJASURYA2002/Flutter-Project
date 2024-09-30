import 'package:flipkart/Data_Insert/datastore.dart';
import 'package:flipkart/Pages/login&otp_page/loginscreen.dart';
import 'package:flipkart/widgets_template.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});
  static const String id = "LanguagesScreen";
  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  bool button = false;
  String top = "Choose Language";
  String bottom = "CONTINUE";
  int selected = -1;

  void enable(int value) {
    for (int i = 0; i < klanguagesData.length; i++) {
      if (i != value) {
        klanguagesData[i]["CurrentStatus"] = false;
      } else {
        klanguagesData[i]["CurrentStatus"] = true;
      }
    }
    setState(() {
      top = klanguagesData[value]["Top"];
      bottom = klanguagesData[value]["bottom"];
      button = true;
      selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A6DD3),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(25, 13, 0, 0),
            margin: EdgeInsets.only(top: 38),
            decoration: BoxDecoration(
              color: Color(0xff2161CB),
            ),
            child: Text(
              top,
              style: GoogleFonts.getFont(
                "Roboto",
                textStyle: TextStyle(
                    color: Color(0xfffcfefc),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /////////////////////
                    LanguagesTemplate(
                      value: 0,
                      status: klanguagesData[0]["CurrentStatus"],
                      clickEvent: () {
                        enable(0);
                      },
                    ),
                    LanguagesTemplate(
                      value: 1,
                      status: klanguagesData[1]["CurrentStatus"],
                      clickEvent: () {
                        enable(1);
                      },
                    ),
                    LanguagesTemplate(
                      value: 2,
                      status: klanguagesData[2]["CurrentStatus"],
                      clickEvent: () {
                        enable(2);
                      },
                    ),
                    LanguagesTemplate(
                      value: 3,
                      status: klanguagesData[3]["CurrentStatus"],
                      clickEvent: () {
                        enable(3);
                      },
                    ),
                    LanguagesTemplate(
                      value: 4,
                      status: klanguagesData[4]["CurrentStatus"],
                      clickEvent: () {
                        enable(4);
                      },
                    ),
                    LanguagesTemplate(
                      value: 5,
                      status: klanguagesData[5]["CurrentStatus"],
                      clickEvent: () {
                        enable(5);
                      },
                    ),
                    LanguagesTemplate(
                      value: 6,
                      status: klanguagesData[6]["CurrentStatus"],
                      clickEvent: () {
                        enable(6);
                      },
                    ),
                    LanguagesTemplate(
                      value: 7,
                      status: klanguagesData[7]["CurrentStatus"],
                      clickEvent: () {
                        enable(7);
                      },
                    ),
                    LanguagesTemplate(
                      value: 8,
                      status: klanguagesData[8]["CurrentStatus"],
                      clickEvent: () {
                        enable(8);
                      },
                    ),
                    LanguagesTemplate(
                      value: 9,
                      status: klanguagesData[9]["CurrentStatus"],
                      clickEvent: () {
                        enable(9);
                      },
                    ),
                    LanguagesTemplate(
                      value: 10,
                      status: klanguagesData[10]["CurrentStatus"],
                      clickEvent: () {
                        enable(10);
                      },
                    ),
                    /////////////////////
                  ],
                ),
              ),
            ),
          ),
          BottomNavigationButton(
            buttonColor: button,
            buttonName: bottom,
            onPressed: () {
              if (selected == 3) {
                Navigator.of(context).pushReplacement(
                  PageTransition(
                    child: LoginPageScreen(),
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(seconds: 1),
                  ),
                );
              } else {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: 'Sorry...',
                  text:
                      '"Currently, only English is supported; support for other languages is coming soon😀."',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
