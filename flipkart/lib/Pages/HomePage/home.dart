import 'package:flipkart/Pages/HomePage/page_1.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: HOME(),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.fromLTRB(25, 6, 25, 3),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xff7d7f80)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/Bottom_Images/home_2.jpg"),
                Image.asset("assets/Bottom_Images/explore_1.jpg"),
                Image.asset("assets/Bottom_Images/categories_1.jpg"),
                Image.asset("assets/Bottom_Images/account_1.jpg"),
                Image.asset("assets/Bottom_Images/cart_1.jpg"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
