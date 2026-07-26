import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/via.dart'
    show NumberController, signUpWithPhoneNumber, verifyOtp;

class otpPage extends StatefulWidget {
  final String verificationId;
  const otpPage({super.key, required this.verificationId});

  @override
  State<otpPage> createState() => _otpPageState();
}
class _otpPageState extends State<otpPage> {
  final TextEditingController otpController = TextEditingController();

  Future<void> verifyOtp() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otpController.text.trim(),
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
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
                controller: otpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter OTP",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              verifyOtp();
            },
            child: Text("Verify OTP"),
          ),
        ],
      ),
    );
  }
}
