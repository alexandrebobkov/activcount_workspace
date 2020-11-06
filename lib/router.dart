import 'package:activcount_workspace/routing_values.dart';
import 'package:activcount_workspace/pages/LandingPage.dart';
import 'package:activcount_workspace/pages/HomePage.dart';
import 'package:activcount_workspace/pages/LoginPage.dart';
import 'package:flutter/material.dart';

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    // TODO: add routing
    switch (settings.name) {
      case Landing:
        return MaterialPageRoute(builder: (context) => LandingPage());
      case LogIn:
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        return MaterialPageRoute(builder: (context) => LandingPage());
    }
  }
}
