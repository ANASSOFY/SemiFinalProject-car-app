import 'package:flutter/material.dart';
import 'car_details_screen.dart';
import 'select_car_brand_screen.dart';

class CarListScreen extends StatelessWidget {
  final String brandName;
  const CarListScreen({super.key, required this.brandName});

  final List<Map<String, dynamic>> cars = const [
    {"name": "2015 Maruti Wagon", "price": "3.31 Lakh", "details": "Petrol - Manual", "image": "https://via.placeholder.com/150"},
    {"name": "2016 Maruti Wagon", "price": "3.50 Lakh", "details": "Petrol - Automatic", "image": "https://via.placeholder.com/150"},
    {"name": "2017 Maruti Wagon", "price": "4.10 Lakh", "details": "Diesel - Manual", "image": "https://via.placeholder.com/150"},
    {"name": "2018 Maruti Wagon", "price": "4.50 Lakh", "details": "Petrol - Automatic", "image": "https://via.placeholder.com/150"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$brandName Cars'),
        backgroundColor: Colors.black,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: cars.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final car = cars[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CarDetailScreen(
                      brandName: brandName,
                      car: car,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.network(car['image'], fit: BoxFit.cover, width: double.infinity),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(car['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            Text(car['details'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            const Spacer(),
                            Text(car['price'], style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
