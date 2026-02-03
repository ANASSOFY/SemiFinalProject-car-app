import 'package:car_store/widgets/button_app.dart';
import 'package:car_store/widgets/cards/free_test_drive_row.dart';
import 'package:car_store/widgets/row_of_tow_text.dart';
import 'package:flutter/material.dart';
import '../../widgets/cards/car_card_rotate.dart';

class BookNowScreen extends StatelessWidget {
  final String name;
  final String details;
  final String price;
  final String imageUrl;
  const BookNowScreen({super.key, required this.name, required this.details, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.amber),
            onPressed: () {},
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
              SizedBox(height: 20),
              RowOfTowText(
                text1: "360 view",
                text2: "1 / 5",
                fontSize1: 16,
                fontSize2: 16,
                color: Colors.grey,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 3,
                  separatorBuilder: (context, builder) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return CarCardRotate(imageUrl: imageUrl,);
                  },
                ),
              ),
          
              SizedBox(height: 20),
              RowOfTowText(text1: "2015 Maruti wagon", text2: "₹$price Lakh"),
              SizedBox(height: 15),
              RowOfTowText(
                text1: details,
                text2: "Fixed on road price",
                color: Colors.grey,
                fontSize1: 16,
                fontSize2: 16,
              ),
          
              const SizedBox(height: 12),
          
              Row(
                children: const [
                  Icon(Icons.home, size: 18, color: Colors.orange),
                  SizedBox(width: 6),
                  Text("Home - test drive - Available",style: TextStyle(fontSize: 16,fontFamily: "Montserrat",fontWeight: FontWeight.bold),),
                ],
              ),
          
              const SizedBox(height: 16),
              FreeTestDriveRow(),
              const SizedBox(height: 40),
          
              ButtonApp(title: "Book now", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
