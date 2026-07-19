import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {
  final String hintText;
  final TextEditingController x;

  Boxes({super.key, required this.hintText, required this.x});

  //bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: TextField(
        // obscureText: isPasswordHidden,
        controller: x,

        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: hintText,
        ),
      ),
    );
  }
}
