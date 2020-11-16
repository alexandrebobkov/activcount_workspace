import 'package:flutter/material.dart';


class Position with ChangeNotifier {
  int pos = 0;

  void setPosition( int i) {
    pos = i;
    notifyListeners();
  }
}
/*
class NavPane {
  int navIndex = 1;

  Widget navTab(BuildContext cont, int _currentIndex) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[400],
      selectedItemColor: Colors.white,
      currentIndex: navIndex,
      onTap: (i) {

        //var position = cont.read<Position>();
        //position.setPosition(i);

        navIndex = i;


        switch (i) {
          case 0: Navigator.pushNamed(cont, '/'); break;
          case 1: Navigator.pushNamed(cont, '/profile'); break;
          case 2: Navigator.pushNamed(cont, '/login'); break;
        }
      },

      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home',),
        BottomNavigationBarItem(
          icon: new Icon(Icons.account_circle_outlined), label: 'Profile',),
        BottomNavigationBarItem(
          icon: new Icon(Icons.login_rounded), label: 'LogIn',),
      ],
    );
  }
}*/