import 'package:activcount_workspace/main.dart';
//import 'package:activcount_workspace/pages/LandingPage.dart';
//import 'package:activcount_workspace/pages/HomePage.dart';
//import 'package:activcount_workspace/pages/LoginPage.dart';
import 'package:activcount_workspace/src/views/login_page_2.dart';
import 'package:activcount_workspace/src/views/setting.dart';
import 'package:flutter/material.dart';

class MyRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    // TODO: add routing
    switch (settings.name) {
      case '/':
        //return MaterialPageRoute(builder: (_) => LoginPage2());
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Setting());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage2());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('path not defined for ${settings.name}')
          ),
        ));
    }
  }
}
