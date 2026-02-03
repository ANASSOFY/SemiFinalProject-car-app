import 'package:car_store/screens/buy/book_now_screen.dart';
import 'package:car_store/screens/buy/buy_home_screen.dart';
import 'package:car_store/screens/buy/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth/landing_screen.dart';
import 'package:car_store/utils/size_config.dart'; 
class ThemeNotifier extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeMode get currentTheme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Builder( 
      builder: (context) {
        SizeConfig.init(context); 

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Car Store App',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeNotifier.currentTheme,
          home: const LandingScreen(),
        );
      },
    );
  }
}
