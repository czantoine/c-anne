import 'package:c_app/sign_up_choice.dart';
import 'package:c_app/sign_up_patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:c_app/accueil_model.dart';
import 'package:c_app/menu_options_screen.dart';
import 'accueil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'accueil_med.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Form(
          key: _formKey,
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
                      padding: EdgeInsets.all(0),
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
                                controller: _emailController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top :14.0),
                                    border: InputBorder.none,
                                    hintText: "Email",
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
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]))),
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top :14.0),
                                    border: InputBorder.none,
                                    hintText: "Mot de passe",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                                validator: (text1) {
                                  if (text1 == null || text1.isEmpty) {
                                    return 'Mot de passe non saisie';
                                  }
                                  return null;
                                },
                                obscureText: true,
                              ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          new InkWell(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  _signInWithEmailAndPassword();
                                  if(_success == true){
                                    Navigator.push(context, new MaterialPageRoute(
                                        builder: (context) => Accueil_Screen()
                                    ));
                                  }
                                }
                              },
                              child:
                              new Container(
                                height: 40,
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
                                height: 40,
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
                            height: 30,
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

    ),
    );
  }

  void _signInWithEmailAndPassword() async {
    final User user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )).user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
/*
       UserType().getUserType(_emailController.text,_passwordController.text).then((querySnapshot) => {
       querySnapshot.forEach((doc) => {
       // doc.data() is never undefined for query doc snapshots
       console.log(doc.id, " => ", doc.data());
       });
       })
            .catch((error) => {
        console.log("Error getting documents: ", error);
        });

*/
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }
}

class UserType {
  getUserType( String Email, String Mdp) {
    return FirebaseFirestore.instance
        .collection('utilisateurs')
        .where('email', isEqualTo: Email)
        .where('mdp', isEqualTo: Mdp )
        .get();
  }
}
/*
class User {
  constructor ( email, mdp, med) {
    this.email = email;
    this.mdp = mdp;
    this.med = med;
  }

  set email(email) {}
  set mdp(mdp) {}
  set med(med) {}
}
*/
/*
// Firestore data converter
fromFirestore: function(snapshot, options){
  const data = snapshot.data(options);
  return new City(data.name, data.state, data.country);
}
};
*/
