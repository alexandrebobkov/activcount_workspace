import 'package:flutter/material.dart';

class NavPane {
  Widget navTab(BuildContext context, int _currentIndex) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[400],
      selectedItemColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (int i) {
        switch (i) {
          case 0: Navigator.pushNamed(context, '/'); break;
          case 1: Navigator.pushNamed(context, '/profile'); break;
          case 2: Navigator.pushNamed(context, '/login'); break;
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
}