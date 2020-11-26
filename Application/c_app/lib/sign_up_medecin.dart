import 'package:c_app/BDD/Client_medecin.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'accueil.dart';
import 'login.dart';
import 'package:c_app/BDD/bdd.dart';

import'package:c_app/BDD/bdd.dart';
import 'package:sqflite/sqflite.dart';



class MedecinSignUpPage extends StatefulWidget {
  @override
  _MedecinSignUpPageState createState() => _MedecinSignUpPageState();
}

class _MedecinSignUpPageState extends State<MedecinSignUpPage> {



  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();


  /// Verifier les input des textfield
  TextEditingController logController = new TextEditingController();
  TextEditingController mdpController = new TextEditingController();
  TextEditingController mdp2Controller = new TextEditingController();
  TextEditingController nomController = new TextEditingController();
  TextEditingController prenomController = new TextEditingController();
  TextEditingController rppsController = new TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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
                          child: Form(
                            key: _formKey,
                          child: TextFormField(
                            controller: logController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email ou numéro de téléphone",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Identifiant non saisie';
                              }
                              return null;
                            },
                          ),
                        ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: Form(
                            key: _formKey2,
                            child: TextFormField(
                              controller: mdpController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mot de passe",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Mot de passe non saisie';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: Form(
                            key: _formKey3,
                            child: TextFormField(
                              controller: mdp2Controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Vérification mot de passe",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Mot de passe non saisie';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: Form(
                            key: _formKey4,
                            child: TextFormField(
                              controller: nomController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Nom",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Nom non saisie';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: Form(
                            key: _formKey5,
                            child: TextFormField(
                              controller: prenomController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Prénom",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Prénom non saisie';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: Form(
                            key: _formKey6,
                            child: TextFormField(
                              controller: rppsController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "RPPS",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'RPPS non saisie';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        new InkWell(
                            onTap: () async {
                              if (_formKey.currentState.validate() && _formKey2.currentState.validate() && _formKey3.currentState.validate()
                                  && _formKey4.currentState.validate() && _formKey5.currentState.validate() && _formKey6.currentState.validate() ) {
                                if(mdpController.text != mdp2Controller.text) {
                                  return 'mot de passe différents';
                                }

                                /*
                                DBProvider().newClient_med(Client_med(
                                    log: logController.text,
                                    mdp: mdpController.text,
                                    nom: nomController.text,
                                    prenom: prenomController.text,
                                    num_rpps: int.parse(rppsController.text)));
                                */
                                //dbProvider = DBProvider() as Type;

                                Client_med rnd = Client_med(
                                    id: 0,
                                    log: logController.text,
                                    mdp: mdpController.text,
                                    nom: nomController.text,
                                    prenom: prenomController.text,
                                    num_rpps: int.parse(rppsController.text));
                                await DBProvider.db.newClient_med(rnd);
                                setState(() {});
                                print("client ADD");


                                Navigator.push(context, new MaterialPageRoute(
                                    builder: (context) => Accueil_Screen()
                                ));
                              }

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
