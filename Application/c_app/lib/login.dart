import 'package:c_app/sign_up_choice.dart';
import 'package:c_app/sign_up_patient.dart';
import 'package:flutter/material.dart';
import 'package:c_app/accueil_model.dart';
import 'package:c_app/menu_options_screen.dart';
import 'accueil.dart';
import 'package:hexcolor/hexcolor.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
          Container(
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/medecine.png'),
              )),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(top: 270),
                  child: Center(
                    child: Text("CONNEXION",
                        style: TextStyle(
                            color: HexColor('#6C63FF'),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
              children: <Widget>[
          Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(102, 0, 255, .2),
                    blurRadius: 20.0,
                    offset: Offset(0, 10))
              ]),
          child: Column(
              children: <Widget>[
          Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[100]))),
          child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email ou numéro de téléphone",
                  hintStyle:
                  TextStyle(color: Colors.grey[400]))),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[100]))),
          child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Mot de passe",
                  hintStyle:
                  TextStyle(color: Colors.grey[400]))),
        ),
        SizedBox(
          height: 30,
        ),
        new InkWell(
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => Accueil_Screen()
              ));
            },
            child:
            new Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [
                        HexColor('#6C63FF'),
                        Color.fromRGBO(102, 0, 255, .6)
                      ]
                  )
              ),
              child: Center(
                child: Text("CONNEXION", style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )),
        SizedBox(
          height: 30,
        ),
        new InkWell(
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => SignUpChoicePage()
              ));
            },
            child:
            new Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [
                        HexColor('#6C63FF'),
                        Color.fromRGBO(102, 0, 255, .6)
                      ]
                  )
              ),
              child: Center(
                child: Text("INSCRIVEZ-VOUS", style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )),
        SizedBox(
          height: 40,
        ),
        new GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "myRoute");
          },
          child: new Text("Mot de passe oublié", style: TextStyle(
              color: Colors.deepPurple))
        ),
        ],
      ),
    )],
    ),
    )
    ],
    ),
    ),
    );
  }
}
