import 'dart:math';

import 'package:flipkart/Pages/login&otp_page/otpscreen.dart';
import 'package:flipkart/services/notification_service.dart';
import 'package:flipkart/widgets_template.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  bool selected = false;
  String mobileNumber = "";
  Random random = Random();
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
                    Text(
                      "Log in for the best experience",
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      "Enter your phone number to continue",
                      // textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: TextStyle(
                            color: Color(0xff868686),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    PhoneNumberInput(
                      onChanged: (value) {
                        mobileNumber = value;
                        setState(() {
                          selected = value.length == 10 ? true : false;
                        });
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.info,
                          text:
                              'We\'re addressing current limitations in some features. Updates soon will resolve these issues. Thank you for your patience and support as we enhance our offerings.',
                        );
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Use Email-ID",
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: TextStyle(
                                color: Color(0xFF244bd7),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "By continuing, you agree to Flipkart's Terms of Use and Privacy Policy",
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: TextStyle(
                            color: Color(0xff868686),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationButton(
              buttonColor: selected,
              buttonName: "Continue",
              onPressed: () async {
                if (mobileNumber.length == 10) {
                  int randomNumber = 100000 + random.nextInt(900000);
                  Future.delayed(Duration(seconds: 4), () async {
                    await NotificationService.showNotification(
                      title: "Flipkart",
                      body:
                          "[#] ${randomNumber} is the OTP to log in to your Flipkart account. DO NOT share this code with anyone including Flipkart delivery agents.\nFrom S.G TECH",
                    );
                  });
                  Navigator.of(context).pushReplacement(
                    PageTransition(
                      child: OtpScreen(
                        mobileNumber: mobileNumber,
                        otp: randomNumber,
                      ),
                      type: PageTransitionType.rightToLeftWithFade,
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
