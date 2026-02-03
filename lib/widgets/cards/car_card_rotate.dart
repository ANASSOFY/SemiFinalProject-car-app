import 'package:flutter/material.dart';

class CarCardRotate extends StatelessWidget {
  final String imageUrl;
  const CarCardRotate({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 120,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(width: 120, height: 90, color: Colors.grey.withOpacity(0.5)),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.rotate_90_degrees_ccw_sharp,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
