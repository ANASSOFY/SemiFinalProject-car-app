import 'package:flutter/material.dart';

class FreeTestDriveRow extends StatelessWidget {
  const FreeTestDriveRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "Assured",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Text(
                "Free test drive",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(Icons.double_arrow_outlined, size: 24, color: Colors.white),
            ],
          ),
        ),
        Spacer(),
        Icon(Icons.favorite_border, size: 26,color: Colors.amber),
      ],
    );
  }
}
