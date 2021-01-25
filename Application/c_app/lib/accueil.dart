import 'package:flutter/material.dart';
import 'package:c_app/accueil_model.dart';
import 'package:c_app/menu_options_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:c_app/test_graph.dart';
import 'package:c_app/profile.dart';

class Accueil_Screen extends StatefulWidget {
  @override
  _Accueil_Screen createState() => _Accueil_Screen();
}

class _Accueil_Screen extends State<Accueil_Screen> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    Home(), //screen1
    Profile(), //screen2
    //Screen3(), //screen3
    MenuOptionsScreen(), //screen4
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Profile")),
          BottomNavigationBarItem(icon: Icon(Icons.assessment), title: Text("Santé")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Options")),
        ],
        selectedItemColor: HexColor('#6C63FF'),
        unselectedItemColor: Colors.grey,

      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.white)),
        backgroundColor: HexColor('#6C63FF'),
      ),
      body: Container(
        color: Colors.white70,
        child: Center(child: Text("Screen 1")),
      ),
    );
  }
}
