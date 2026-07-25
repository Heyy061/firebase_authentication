import 'package:firebase_auth/firebase_auth.dart'
    show
        FirebaseAuth,
        UserCredential,
        FirebaseAuthException,
        GoogleAuthProvider;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart'
    show GoogleSignInAuthentication, GoogleSignInAccount, GoogleSignIn;

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
    // for email verification
    await userCredential.user!.sendEmailVerification();

    // print(userCredential.user!.uid);    To print uid
  } on FirebaseAuthException catch (e) {
    print(e.message);
    print(e.code);
  }
}

/////////////////////////////////////////////////////////////
///signup with google for
Future<UserCredential?> signUpWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return null; // User cancelled
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    print(e);
    return null;
  }
}
//////////////////////////////////////////////////////////////////

class Via extends StatelessWidget {
  final IconData icon1;
  final String name1;
  final VoidCallback onPress;
  const Via({
    super.key,
    required this.icon1,
    required this.name1,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Card(
          elevation: 3,
          child: Container(
            height: 90,
            width: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 232, 232, 229),
            ),
            child: Column(
              children: [
                IconButton(onPressed: onPress, icon: Icon(icon1, size: 50)),
                Text(name1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
