import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final String image;
  const BrandCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(image, fit: BoxFit.contain),
    );
  }
}
