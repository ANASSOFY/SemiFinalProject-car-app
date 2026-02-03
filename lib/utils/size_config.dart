import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/size_config.dart';
      
class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    screenWidth = mediaQuery.width;
    screenHeight = mediaQuery.height;
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }
}
