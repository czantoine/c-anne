import 'package:c_app/login_med.dart';
import 'package:flutter/material.dart';
import 'package:c_app/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:c_app/accueil_med.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'c-Anne demo',
      debugShowCheckedModeBanner: false,
      home: LoginMed(),
    );
  }
}
