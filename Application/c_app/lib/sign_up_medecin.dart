import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'accueil.dart';
import 'login.dart';
import 'package:form_validator/form_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class MedecinSignUpPage extends StatefulWidget {
  @override
  _MedecinSignUpPageState createState() => _MedecinSignUpPageState();
}

class _MedecinSignUpPageState extends State<MedecinSignUpPage> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  User medecin;

  //Collection utilisateur depuis firestore
  final CollectionReference collectionMed = FirebaseFirestore.instance.collection('Personnel Médical');

  String email = '';
  String mdp = '';
  String confirmMdp = '';
  String nom='';
  String prenom = '';
  String num_RPPS;


  final _formKey = GlobalKey<FormState>();


  /// Verifier les input des textfield
  TextEditingController logController = new TextEditingController();
  TextEditingController mdpController = new TextEditingController();
  TextEditingController mdp2Controller = new TextEditingController();
  TextEditingController nomController = new TextEditingController();
  TextEditingController prenomController = new TextEditingController();
  TextEditingController rppsController = new TextEditingController();

  final validatorEmail = ValidationBuilder().email().maxLength(50).build();

  @override
  Widget build(BuildContext context) {

    FirebaseAuth.instance.authStateChanges().listen((User user) {
      setState(() {
        this.medecin = user;
      });
    });

    String _idUtil(){
      if(medecin != null){
        return medecin.uid;
      }else{
        return "pas d'utilisateur courant";
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
              child: Form(
                key: _formKey,
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
                              child: TextFormField(
                                controller: logController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                                validator:
                                validatorEmail,
                                onChanged: (val) => email = val,
                              ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                              child: TextFormField(
                                controller: mdpController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mot de passe",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                                validator: (val) => val.isEmpty ? 'Entrez un mot de passe' : null,
                                onChanged: (val) => mdp = val,
                                obscureText: true,
                              ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                              child: TextFormField(
                                controller: mdp2Controller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Vérification mot de passe",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                                validator: (val) => confirmMdp != mdp ? 'Mot de passe ne correspond pas' : null,
                                onChanged: (val) => confirmMdp = val,
                                obscureText: true,
                              ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                              child: TextFormField(
                                controller: nomController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nom",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                                validator: (val) => val.isEmpty ? 'Entrez votre Nom' : null,
                                onChanged: (val) => nom = val,
                              ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                              child: TextFormField(
                                controller: prenomController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Prénom",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                                validator: (val) => val.isEmpty ? 'Entrez votre Prénom' : null,
                                onChanged: (val) => prenom = val,
                              ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                              child: TextFormField(
                                controller: rppsController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "RPPS",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                                validator: (val) => val.isEmpty ? 'Entrez votre Numéro de RPPS' : null,
                                onChanged: (val) => num_RPPS = val,
                              ),
                            ),

                          SizedBox(
                            height: 30,
                          ),
                          new InkWell(
                              onTap: () async {
                                if(_formKey.currentState.validate()){

                                  try {
                                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: mdp);

                                    FirebaseFirestore.instance.collection("Personnel Médical").add(
                                        {
                                          "email" : email,
                                          "mdp" : mdp,
                                          "nom" : nom,
                                          "prenom" : prenom,
                                          "numero de securité sociale" : num_RPPS
                                        }
                                    ).then((value) {
                                      print(value.id);
                                    });
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context){
                                          return AlertDialog(
                                              title: const Text('Merci !'),
                                              content: Text ('Vous êtes enregistré'),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () { Navigator.pop(context); },
                                                  child: Text('OK',
                                                    style: TextStyle(
                                                        color: HexColor('#6C63FF')),),
                                                )
                                              ]
                                          );
                                        }
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      print('The password provided is too weak.');
                                    } else if (e.code == 'email-already-in-use') {
                                      print('The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
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
              ),
            )
          ],
        ));
  }
}
