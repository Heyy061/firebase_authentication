import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/boxes.dart' show Boxes;

import 'signUpPage.dart' show signUpPage;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> LoginUserByEmail() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Card(
            elevation: 10,
            child: SizedBox(
              width: 320,
              height: 480,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight(350),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Text("Sign  In to continue"),

                  //////////////////////////////////////////////
                  SizedBox(height: 22),
                  Boxes(hintText: "Email Id", x: emailController),
                  SizedBox(height: 16),
                  Boxes(hintText: "Password", x: passwordController),
                  /////////////////////////////////////////////////
                  SizedBox(height: 16),

                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        LoginUserByEmail();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(176, 0, 0, 0),
                        ),
                      ),
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight(500),
                          ),
                        ),
                      ),
                      ////////////////////////////////////////////////
                      GestureDetector(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return signUpPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
