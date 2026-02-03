import 'package:flutter/material.dart';

class RowOfTowText extends StatelessWidget {
  final String text1;
  final String text2;
  final double? fontSize1;
  final double? fontSize2;
  final Color? color;

  const RowOfTowText({super.key, required this.text1, required this.text2, this.color=Colors.black, this.fontSize1=15, this.fontSize2=20});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: fontSize1,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
            color: color,
          ),
        ),
        Spacer(),
        Text(
          text2,
          style: TextStyle(
            fontSize: fontSize2,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
            color: color,
          ),
        ),
      ],
    )
    ;
  }
}
