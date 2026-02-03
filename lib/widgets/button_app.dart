import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final  void Function()? onPressed;
  final String title;

  const ButtonApp({super.key, this.onPressed, required this.title});


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          onPressed:onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              Icon(Icons.double_arrow_outlined,size: 24,color: Colors.white,),
            ],)
      ),
    );
  }
}
