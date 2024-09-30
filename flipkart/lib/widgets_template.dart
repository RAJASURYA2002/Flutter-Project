import 'package:flipkart/Data_Insert/datastore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Languages Template//
class LanguagesTemplate extends StatelessWidget {
  const LanguagesTemplate(
      {super.key, this.value, this.status, this.clickEvent});
  final int? value;
  final bool? status;
  final void Function()? clickEvent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickEvent,
      child: Column(
        children: [
          //Main Box//
          Container(
            height: 70,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(22, 0, 15, 0),
            decoration: BoxDecoration(
              color: status == true ? Color(0xffe8f1ff) : Colors.white,
              border: status == true
                  ? Border.all(color: Color(0xff1c44d2), width: 2.0)
                  : Border.all(color: Color(0xffd2d2d2), width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color:
                              status == true ? Color(0xff377eef) : Colors.white,
                          border: status == true
                              ? Border.all(color: Color(0xff377eef), width: 2.0)
                              : Border.all(
                                  color: Color(0xffd2d2d2), width: 2.0),
                          shape: BoxShape.circle),
                      child: status == true
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            )
                          : Text(""),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          klanguagesData[value!]["LanguagesNameNative"],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          klanguagesData[value!]["LanguagesNameEng"],
                          style: GoogleFonts.getFont(
                            "Roboto",
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: const Color.fromARGB(100, 0, 0, 0),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                status == true
                    ? Image.asset(klanguagesData[value!]["ImageActive"])
                    : Image.asset(klanguagesData[value!]["ImagedeActive"])
              ],
            ),
          ),
          //Main Box//
          status == true &&
                  klanguagesData[value!]["LanguagesNameEng"] != "English"
              ? SizedBox(
                  height: 5,
                )
              : SizedBox(
                  height: 0,
                ),
          Text(
            status == true
                ? klanguagesData[value!]["LanguagesDescription"]
                : "",
            // textAlign: TextAlign.justify,
            style: GoogleFonts.getFont(
              "Roboto",
              textStyle: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(180, 0, 0, 0),
                  fontWeight: FontWeight.w200),
            ),
          ),
          status == true &&
                  klanguagesData[value!]["LanguagesNameEng"] != "English"
              ? SizedBox(
                  height: 20,
                )
              : SizedBox(
                  height: 0,
                ),
        ],
      ),
    );
  }
}

//Languages Template//
//BottomNavigationButton Template//

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton(
      {super.key,
      required this.buttonColor,
      required this.buttonName,
      this.onPressed});

  final bool buttonColor;
  final String buttonName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xffbdbebf), width: 1.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor == true ? Color(0xff2b55e5) : Color(0xffc2c2c2)),
        child: TextButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              buttonName,
              style: GoogleFonts.getFont(
                "Roboto",
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//BottomNavigationButton Template//

//Phone Number Template//
class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  String _selectedCountryCode = '+91';
  final List<String> _countryCodes = ['+1', '+44', '+91', '+86', '+61'];
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    // Automatically focus the text field when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      focusNode: _focusNode,
      keyboardType: TextInputType.phone,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(
            color: Color(0xFF244bd7),
            fontSize: 18,
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF244bd7), width: 2.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF244bd7), width: 2.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedCountryCode,
              items: _countryCodes.map((String code) {
                return DropdownMenuItem<String>(
                  value: code,
                  child: Text(code),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCountryCode = newValue!;
                });
              },
            ),
          ),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
      ),
    );
  }
}
//Phone Number Template//

//Page-1 TOP CONTAINER LOGO

class TopContainerLogo extends StatelessWidget {
  const TopContainerLogo({super.key, this.color, this.image});
  final Color? color;
  final Widget? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 45,
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: image,
    );
  }
}

class CricleSlide extends StatelessWidget {
  const CricleSlide(
      {super.key, this.image, this.tag, this.tagName, this.circleName});
  final String? image;
  final bool? tag;
  final String? tagName;
  final String? circleName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(image!),
            ),
            tag == true
                ? Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      color: Colors.red,
                      child: Text(
                        tagName!,
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Text(""),
          ],
        ),
        Text(
          circleName!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ThreeImage extends StatelessWidget {
  const ThreeImage({super.key, this.image, this.text1, this.text2});
  final String? image;
  final String? text1;
  final String? text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        // border: Border.all(color: Color(0xff7d7f80))
        border: Border(
          top: BorderSide(color: Color(0xff7d7f80)),
          right: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
          left: BorderSide(color: Color(0xff7d7f80)),
        ),
      ),
      child: Container(
        height: 85,
        width: 80,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff7d7f80), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Image.network(
              image!,
              fit: BoxFit.cover,
            ),
            Text(
              text1!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              text2!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
