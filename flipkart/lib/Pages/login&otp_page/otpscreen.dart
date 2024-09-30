import 'dart:async';

import 'package:flipkart/Pages/HomePage/home.dart';
import 'package:flipkart/Pages/login&otp_page/loginscreen.dart';
import 'package:flipkart/widgets_template.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.mobileNumber, this.otp});
  final String? mobileNumber;
  final int? otp;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? timer;
  int start = 30;
  bool selected = false;
  String otp = "";
  final localData = Hive.box('userdata');
  @override
  void initState() {
    super.initState();
    starttimer();
  }

  void starttimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2873f0),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff2873f0),
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: Image.asset("assets/Login/login_logo.png")))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 40, 25, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          PageTransition(
                            child: LoginPageScreen(),
                            type: PageTransitionType.leftToRightWithFade,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Please enter the verification code we\'ve sent \nyou on +91-${widget.mobileNumber} ',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " Edit",
                              style: TextStyle(
                                  color: Color(0xff3056cb),
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    OtpTextField(
                      fieldWidth: 45.0,
                      showCursor: false,
                      numberOfFields: 6,
                      borderColor: Color(0xffc2c2c2),
                      focusedBorderColor: Color(0xff3056cb),
                      showFieldAsBox: false,
                      borderWidth: 3.0,
                      onCodeChanged: (String code) {
                        print(code);
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        if (widget.otp.toString() == verificationCode) {
                          Navigator.of(context).pushReplacement(
                            PageTransition(
                              child: HomeScreen(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: Duration(seconds: 1),
                            ),
                          );
                          localData.put("Login", true);
                        } else {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.warning,
                            text: 'OTP ERROR!...',
                          );
                        }
                        setState(() {
                          selected = true;
                          otp = verificationCode;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/Login/otp_loading.gif",
                          width: 60,
                          height: 60,
                        ),
                        Text(
                          "Trying to Auto Capture",
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: TextStyle(
                                color: Color(0xff676767),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "00:${start}" == "00:0" ? "Retry" : "00:${start}",
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationButton(
              buttonColor: selected,
              buttonName: "Continue",
              onPressed: () {
                if (otp.length == 6 && widget.otp.toString() == otp) {
                  Navigator.of(context).pushReplacement(
                    PageTransition(
                      child: HomeScreen(),
                      type: PageTransitionType.rightToLeftWithFade,
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
                localData.put("Login", true);
              },
            )
          ],
        ),
      ),
    );
  }
}
