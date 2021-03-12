import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:form_validator/form_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:c_app/login.dart';


class MySignUpPage extends StatefulWidget {
  @override
  _MySignUpPageState createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  User utilisateur;


  //Collection utilisateur depuis firestore
  final CollectionReference collectionUtil = FirebaseFirestore.instance.collection('utilisateurs');

  String email = '';
  String mdp = '';
  String confirmMdp = '';
  String nom='';
  String prenom = '';
  String num_secu;
  String nom_medecin = '';
  String num_medecin;
  String nom_urgence3 = '';
  String num_urgence3;
  String nom_urgence2 = '';
  String num_urgence2;

  final validatorEmail = ValidationBuilder().email().maxLength(50).build();
  final validatorNum = ValidationBuilder().phone().maxLength(50).build();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    FirebaseAuth.instance.authStateChanges().listen((User user) {
      setState(() {
        this.utilisateur = user;
      });
    });

    String _idUtil(){
      if(utilisateur != null){
        return utilisateur.uid;
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
                    image: AssetImage('assets/images/setup.png'),
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
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Vérification du mot de passe",
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
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Numéro de sécurité sociale",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: (val) => val.isEmpty ? 'Entrez votre Numéro de sécurité sociale' : null,
                              onChanged: (val) => num_secu = val,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:20),
                            child: Center(
                              child: Text("CONTACT D'URGENCE",
                                  style: TextStyle(
                                      color: HexColor('#6C63FF'),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Médecin",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: (val) => val.isEmpty ? 'Entrez le nom' : null,
                              onChanged: (val) => nom_medecin = val,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Numero médecin",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: validatorNum,
                              onChanged: (val) => num_medecin = val,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Contact d'urgence 2",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: (val) => val.isEmpty ? 'Entrez Contact Urgence' : null,
                              onChanged: (val) => nom_urgence2 = val,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Numéro d'urgence 2",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: validatorNum,
                              onChanged: (val) => num_urgence2 = val,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Contact d'urgence 3",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: (val) => val.isEmpty ? 'Entrez Contact Urgence' : null,
                              onChanged: (val) => nom_urgence3 = val,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Numéro d'urgence 3",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                              validator: validatorNum,
                              onChanged: (val) => num_urgence3 = val,
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

                                    FirebaseFirestore.instance.collection("utilisateurs").add(
                                        {
                                          "email" : email,
                                          "mdp" : mdp,
                                          "nom" : nom,
                                          "prenom" : prenom,
                                          "num_secu" : num_secu,
                                          "nom_medecin" : nom_medecin,
                                          "num_medecin" : num_medecin,
                                          "nom_urgence2" : nom_urgence2,
                                          "num_urgence2" : num_urgence2,
                                          "nom_urgence3" : nom_urgence3,
                                          "num_urgence3" : num_urgence3
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
                                                )]);
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
