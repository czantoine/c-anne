import 'package:c_app/sign_up_medecin.dart';
import 'package:c_app/sign_up_patient.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:c_app/accueil_model.dart';
import 'package:c_app/menu_options_screen.dart';
import 'accueil.dart';
import 'login.dart';

class SignUpChoicePage extends StatefulWidget {
  @override
  _SignUpChoicePageState createState() => _SignUpChoicePageState();
}

class _SignUpChoicePageState extends State<SignUpChoicePage> {
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
                    image: AssetImage('assets/images/medecine.png'),
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
                        SizedBox(
                          height: 30,
                        ),
                        new InkWell(
                            onTap: () {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => MedecinSignUpPage()
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
                                child: Text("PERSONNEL MÉDICAL", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        new InkWell(
                            onTap: () {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => MySignUpPage()
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
                                child: Text("PERSONNE À MOBILITÉ RÉDUITE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                                child: Text("RETOUR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
