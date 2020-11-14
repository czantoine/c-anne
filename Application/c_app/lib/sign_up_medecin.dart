import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:c_app/accueil_model.dart';
import 'package:c_app/menu_options_screen.dart';
import 'accueil.dart';
import 'login.dart';

class MedecinSignUpPage extends StatefulWidget {
  @override
  _MedecinSignUpPageState createState() => _MedecinSignUpPageState();
}

class _MedecinSignUpPageState extends State<MedecinSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/doctor.png'),
                  )),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 270),
                      child: Center(
                        child: Text("INSCRIPTION",
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
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Vérification du mot de passe",
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
                                  hintText: "Nom",
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
                                  hintText: "Prénom",
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
                                  hintText: "Numéro RPPS",
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
                                child: Text("CRÉER VOTRE COMPTE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        new InkWell(
                            onTap: () {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => MyLoginPage()
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
                                child: Text("RETOUR CONNEXION", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
