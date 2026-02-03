import 'package:flutter/material.dart';

class CarDetailScreen extends StatelessWidget {
  final String brandName;
  final Map<String, dynamic> car;

  const CarDetailScreen({super.key, required this.brandName, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${car['name']} Details'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(car['image'], width: double.infinity, height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(car['name'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(car['details'], style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 8),
            Text(car['price'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                child: const Text("Buy Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
