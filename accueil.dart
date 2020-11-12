import 'package:flutter/material.dart';
import 'package:canneapp/accueil_model.dart';
import 'package:canneapp/menu_options_screen.dart';

class Acceuil_Screen extends StatefulWidget {
  @override
  _Acceuil_Screen createState() => _Acceuil_Screen();
}

class _Acceuil_Screen extends State<Acceuil_Screen> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Accueil'),
        leading: FlatButton(
          textColor: Colors.white,
          child: Icon(
            Icons.list,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil_Screen()));
          },
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            child: Icon(
                Icons.settings
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuOptionsScreen()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: options.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(height: 10.0);
          } else if (index == options.length + 1) {
            return SizedBox(height: 100.0);
          }
          return Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: _selectedOption == index - 1
                  ? Border.all(color: Colors.black26)
                  : null,
            ),
            child: ListTile(
              leading: options[index - 1].icon,
              title: Text(
                options[index - 1].title,
                style: TextStyle(
                  color: _selectedOption == index - 1
                      ? Colors.black
                      : Colors.grey[600],
                ),

              ),
              selected: _selectedOption == index - 1,
              onTap: () {
                setState(() {
                  _selectedOption = index - 1;
                });
              },
            ),

          );
        },
      ),
    );
  }
}