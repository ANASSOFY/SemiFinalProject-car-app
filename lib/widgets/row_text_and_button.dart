import 'package:flutter/material.dart';

class RowTextAndButton extends StatelessWidget {
  final String text;
  final String buttonTitle;
  const RowTextAndButton({super.key, required this.text, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.orangeAccent,
          ),
          child: Text(
            buttonTitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
