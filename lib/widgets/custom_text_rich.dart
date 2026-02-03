import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  final String text1;
  final String text2;

  const CustomTextRich({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text1,
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: text2,
            style: TextStyle(
              fontFamily: "Montserrat",

              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}
