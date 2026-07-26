import 'package:flutter/material.dart';
import 'package:signup/via.dart';

class Phonenumberpage extends StatefulWidget {
  const Phonenumberpage({super.key});

  @override
  State<Phonenumberpage> createState() => _phonenumberpageState();
}

class _phonenumberpageState extends State<Phonenumberpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 400,
              child: TextField(
                controller: NumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              signUpWithPhoneNumber(context);
            },
            child: Text("Send OTP"),
          ),
        ],
      ),
    );
  }
}
