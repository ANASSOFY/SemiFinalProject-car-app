import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldApp extends StatefulWidget {

  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController controller;

  const TextFieldApp({
    super.key,
    required this.title,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.inputFormatters,
    required this.controller,
  });

  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {

  late bool isHidden;

  @override
  void initState() {
    super.initState();
    isHidden = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat"
          ),
        ),

        const SizedBox(height: 20),

        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: isHidden,
          inputFormatters: widget.inputFormatters,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
            ),

            suffixIcon: widget.obscureText
                ? IconButton(
              icon: Icon(
                isHidden ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
            )
                : null,

            filled: true,
            fillColor: Colors.black.withOpacity(0.4),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.orangeAccent,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
