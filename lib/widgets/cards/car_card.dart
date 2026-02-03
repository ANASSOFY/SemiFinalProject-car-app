import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final String name;
  final String details;
  final String price;
  final String imageUrl;
  final VoidCallback? onBuyTap;
  final VoidCallback? onFavoriteTap;

  const CarCard({
    super.key,
    required this.name,
    required this.details,
    required this.price,
    required this.imageUrl,
    this.onBuyTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBuyTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(imageUrl, height: 120, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: const Icon(Icons.favorite_border, color: Colors.red),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(details, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
