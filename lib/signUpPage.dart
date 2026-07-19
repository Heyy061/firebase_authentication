import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/SignInPage.dart' show SignInPage;
import 'boxes.dart' show Boxes;

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signupState();
}

class _signupState extends State<signUpPage> {
  //To input email,password in textfield
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> createUserByEmail() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      print(userCredential.user!.uid); //to print uid
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);
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
                      "Sign up",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight(350),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Text("Sign  up to continue"),

                  ////////////////////////////////////////////////////////
                  SizedBox(height: 22),
                  Boxes(hintText: "Email Id", x: emailController),
                  SizedBox(height: 16),
                  Boxes(hintText: "Password", x: passwordController),
                  ///////////////////////////////////////////////////////
                  SizedBox(height: 16),

                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () async {
                        await createUserByEmail();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(176, 0, 0, 0),
                        ),
                      ),
                      child: const Text(
                        "SIGN UP",
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
                                  return SignInPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
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
