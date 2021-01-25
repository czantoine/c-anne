import 'package:flutter/material.dart';
import 'package:c_app/accueil_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:c_app/login.dart';


class Accueil_Med_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home Medecin',
        home: new SearchBarHome());
  }
}

class SearchBarHome extends StatefulWidget {
  @override
  _SearchBarHomeState createState() => new _SearchBarHomeState();
}

class _SearchBarHomeState extends State<SearchBarHome> {
  String num_secu = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#6C63FF'),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            showDialog(context: context,
            builder: (BuildContext context){
              return AlertDialog(
                  title: const Text('Attention !'),
                  content: Text ('Souhaitez vous vous déconnectez ?'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => LoginPatient()
                        ));
                      },
                      child: Text('OK',
                        style: TextStyle(
                            color: HexColor('#6C63FF')),),
                    ),
                    FlatButton(
                      onPressed: () { Navigator.pop(context); },
                      child: Text('Annuler',
                        style: TextStyle(
                            color: HexColor('#6C63FF')),),
                    )
                  ]
              );
            });
          },
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Rechercher un patient...'),
            onChanged: (val) {
              setState(() {
                num_secu = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (num_secu != "" && num_secu != null)
            ? FirebaseFirestore.instance
            .collection('utilisateurs')
            .where("num_secu", isEqualTo: num_secu)
            .snapshots()
            : FirebaseFirestore.instance.collection("utilisateurs").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data.docs[index];
              return Card(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      data['nom'],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      data['prenom'],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      data['num_secu'],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rechercher un patient", style: TextStyle(color: Colors.white)),
        backgroundColor: HexColor('#6C63FF'),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search), onPressed:() {
          })
        ],
      ),
      body: Container(
        color: Colors.white70,
        child: Center(child: Text("Screen 1")),
      ),
    );
  }
}
