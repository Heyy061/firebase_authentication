import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signup/firebase_options.dart';
import 'signUpPage.dart' show signUpPage, signup;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: signUpPage());
  }
}
