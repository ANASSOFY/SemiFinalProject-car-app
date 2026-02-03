import 'package:car_store/widgets/button_app.dart';
import 'package:car_store/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'create_account_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/carr.jpg', fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextRich(
                      text1: "Your Trusted Marketplace\nfor Second-Hand ",
                      text2: "Cars\"",
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .65),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Discover the Best Deals\non Pre-Owned Cars",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonApp(
                      title: "Get Started",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccountScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
