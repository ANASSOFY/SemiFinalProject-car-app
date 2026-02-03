import 'package:flutter/material.dart';

class SignUpWithCard extends StatelessWidget {
  const SignUpWithCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign up with",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),
          SizedBox(width: 30),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              color: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/Logo-google.png"),
              ),
            ),
          ),
          SizedBox(width: 15),
          VerticalDivider(),
          SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              color: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/apple-logo.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
