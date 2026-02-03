import 'package:flutter/material.dart';

class SuggestionCard extends StatelessWidget {
  final String image;
  const SuggestionCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
              borderRadius: BorderRadius.circular(20)
          ),
        ),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find the perfect car \nfor you",
              style: TextStyle(
                fontSize: 15,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Thousands of mrl cars",
              style: TextStyle(
                fontSize: 10,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
