import 'package:flutter/material.dart';

class CustomTextWithClick extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const CustomTextWithClick({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ],
    );
    ;
  }
}
