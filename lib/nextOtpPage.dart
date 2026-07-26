import 'package:flutter/material.dart';

class greeting extends StatelessWidget {
  const greeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Text("HELLO"),
          decoration: BoxDecoration(color: Color.fromARGB(1, 7, 2, 4)),
        ),
      ),
    );
  }
}
