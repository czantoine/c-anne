import 'package:flutter/material.dart';
import 'package:c_app/accueil.dart';
import 'package:c_app/login.dart';
import 'package:c_app/sign_up_patient.dart';
import 'package:c_app/BDD/bdd.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'c-Anne demo',
      debugShowCheckedModeBanner: false,
      home: MyLoginPage(),
    );
  }
}
