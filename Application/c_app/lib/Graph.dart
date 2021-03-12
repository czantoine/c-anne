import 'package:flutter/material.dart';
import 'package:c_app/accueil_model.dart';
import 'package:c_app/menu_options_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:c_app/test_graph.dart';
import 'package:c_app/profile.dart';

class Graph extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graph",style: TextStyle(color: Colors.white)),
        backgroundColor: HexColor('#6C63FF'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(child: Text("Screen 3")),
      ),
    );
  }

}