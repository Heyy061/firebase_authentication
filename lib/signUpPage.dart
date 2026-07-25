import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/SignInPage.dart' show SignInPage;
import 'package:signup/via.dart';
import 'boxes.dart' show Boxes;

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpState();
}

class _signUpState extends State<signUpPage> {
  // Sign up with google
  Future<void> signUpWithGoogle() async {}

  ///////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Card(
            elevation: 10,
            child: SizedBox(
              width: 320,
              height: 580,
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
                  Text("Sign up to continue"),

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
                        print("Sign Up completed");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Verification email sent! Please check your inbox.",
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
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

                  SizedBox(height: 25),
                  Row(
                    children: [
                      Via(
                        icon1: Icons.g_mobiledata_sharp,
                        name1: "GOOGLE",
                        onPress: () async {
                          await signUpWithGoogle();
                        },
                      ),
                      SizedBox(width: 1),
                      Via(
                        icon1: Icons.contact_page_outlined,
                        name1: "NUMBER",
                        onPress: () async {
                          await signUpWithPhoneNumber();
                        },
                      ),
                    ],
                  ),
                  ////////////////////////////////////////////////////////////////////////////////////////////////
                  SizedBox(height: 20),

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
//