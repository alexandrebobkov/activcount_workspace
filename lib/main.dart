// Author: Alexandre Bobkov

// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:activcount_workspace/router.dart';
import 'package:activcount_workspace/services/nav_pane.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}
const List<Destination> allDestinations = <Destination> [
  Destination('Home', Icons.home, Colors.grey),
  Destination('Login', Icons.login_outlined, Colors.grey),
];

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'activcount Workdesk Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage2(),
      onGenerateRoute: MyRouter().generateRoute,
      initialRoute: '/',
    );
  }
}
class LandingPage2 extends StatelessWidget {
  final int _currentIndex = 0;
  final navpane = new NavPane();

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Container (
            decoration: BoxDecoration (
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView (
            child: Column(
              children: <Widget> [
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.15,
                    bottom: MediaQuery.of(context).size.height*0.15,
                    left: MediaQuery.of(context).size.width*0.10,
                    right: MediaQuery.of(context).size.width*0.10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:0, bottom:0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget> [
                          Padding(
                            padding: const EdgeInsets.only(top:10, bottom:10),
                            child: Text('Welcome', style: TextStyle(fontSize:25, fontWeight: FontWeight.bold, color: Colors.blue),),
                          ),
                          Padding (
                            padding: const EdgeInsets.all(10),
                            child: Text("You have pressed the button this many times", style: TextStyle(fontSize:16, fontWeight: FontWeight.normal, color: Colors.black),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            //child: Consumer <Counter> ( builder: (context, counter, child) => Text ('${counter.value}', style: Theme.of(context).textTheme.headline1),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //var counter = context.read<Counter>();
          //counter.increment();
          //setState(() {mainWidget = LoginPage();});

          //Navigator.of(context).push(MaterialPageRoute<Null> (builder: (BuildContext context) { return new LoginPage(); } ));
          Navigator.pushNamed(context, '/login');
        },
        child: Icon (Icons.add),
      ),
      bottomNavigationBar: navpane.navTab(context, _currentIndex),
    );
  }
  Widget _navTab(BuildContext context, int ind) {
    return BottomNavigationBar (
      backgroundColor: Colors.white60,
      selectedItemColor: Colors.green,
      currentIndex: ind,
      onTap: (int index) {
        if (index == 0)
          Navigator.pushNamed(context, '/');
        else if (index == 1)
          Navigator.pushNamed(context, '/profile');
        else if (index == 2)
          Navigator.pushNamed(context, '/login');
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home',),
        BottomNavigationBarItem(icon: new Icon(Icons.account_circle_outlined), label: 'Profile',),
        BottomNavigationBarItem(icon: new Icon(Icons.login_rounded), label: 'LogIn',),
      ],
    );
  }
}

// This is the stateful widget that the main application instantiates.
class LandingPage extends StatefulWidget {
//class LandingPage extends StatelessWidget {
  LandingPage({Key key, this.destination}) : super(key: key);
  final Destination destination;

  @override
  _LandingPage createState() => _LandingPage();
}
class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 7;
    notifyListeners();
  }
}

class _LandingPage extends State<LandingPage> {


  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {

  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Container (
            decoration: BoxDecoration (
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView (
            child: Column(
              children: <Widget> [
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.15,
                    bottom: MediaQuery.of(context).size.height*0.15,
                    left: MediaQuery.of(context).size.width*0.10,
                    right: MediaQuery.of(context).size.width*0.10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:0, bottom:0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget> [
                          Padding(
                            padding: const EdgeInsets.only(top:10, bottom:10),
                            child: Text('Welcome', style: TextStyle(fontSize:25, fontWeight: FontWeight.bold, color: Colors.blue),),
                          ),
                          Padding (
                            padding: const EdgeInsets.all(10),
                            child: Text("You have pressed the button this many times", style: TextStyle(fontSize:16, fontWeight: FontWeight.normal, color: Colors.black),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            //child: Consumer <Counter> ( builder: (context, counter, child) => Text ('${counter.value}', style: Theme.of(context).textTheme.headline1),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //var counter = context.read<Counter>();
          //counter.increment();
          //setState(() {mainWidget = LoginPage();});

          //Navigator.of(context).push(MaterialPageRoute<Null> (builder: (BuildContext context) { return new LoginPage(); } ));
          Navigator.pushNamed(context, '/login');
        },
        child: Icon (Icons.add),
      ),
        bottomNavigationBar: _navTab(),
    );
  }
  Widget _navTab() {
    return BottomNavigationBar (
      backgroundColor: Colors.white60,
      selectedItemColor: Colors.green,
      currentIndex: _currentIndex,
      onTap: (int index) {
        if (index == 0) {
          //Navigator.of(context).push(MaterialPageRoute<Null> (builder: (BuildContext context) { return LandingPage(); }));
        }
        else if (index == 1) {}
        else if (index == 2) {
          Navigator.of(context).push(MaterialPageRoute<Null> (builder: (BuildContext context) { return LoginPage2(); }));
        }
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home',),
        BottomNavigationBarItem(icon: new Icon(Icons.account_circle_outlined), label: 'Profile',),
        BottomNavigationBarItem(icon: new Icon(Icons.login_rounded), label: 'LogIn',),
      ],
    );
  }
}
// Simplest possible model, with just one field.
//
// [ChangeNotifier] is a class in `flutter:foundation`. [Counter] does
// _not_ depend on Provider.


class LoginPage2 extends StatelessWidget {
  final int _currentIndex = 0;
  final navpane = new NavPane();

  @override
  Widget build (BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget> [
          Container (
            decoration:
            BoxDecoration (
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,),),
          ),
          SingleChildScrollView (
            child: Column(
              children: <Widget> [
                Container (
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.15,
                    bottom: MediaQuery.of(context).size.height*0.15,
                    left: MediaQuery.of(context).size.width*0.10,
                    right: MediaQuery.of(context).size.width*0.10,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(top:10, bottom:10),
                          child: Text('Log-In', style: TextStyle(fontSize:25, fontWeight: FontWeight.bold, color: Colors.blue),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: navpane.navTab(context, _currentIndex),
    );
  }
  /*Widget _navTab(BuildContext context, int ind) {
    return BottomNavigationBar(
      backgroundColor: Colors.white60,
      selectedItemColor: Colors.green,
      currentIndex: ind,
      onTap: (int index) {
        if (index == 0)
          Navigator.pushNamed(context, '/');
        else if (index == 1)
          Navigator.pushNamed(context, '/profile');
        else if (index == 2)
          Navigator.pushNamed(context, '/login');
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home',),
        BottomNavigationBarItem(
          icon: new Icon(Icons.account_circle_outlined), label: 'Profile',),
        BottomNavigationBarItem(
          icon: new Icon(Icons.login_rounded), label: 'LogIn',),
      ],
    );
  }*/
}

class Profile2 extends StatelessWidget {
  final int _currentIndex = 0;
  final navpane = new NavPane();

  @override
  Widget build (BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget> [
          Container (
            decoration:
            BoxDecoration (
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,),),
          ),
          SingleChildScrollView (
            child: Column(
              children: <Widget> [
                Container (
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.15,
                    bottom: MediaQuery.of(context).size.height*0.15,
                    left: MediaQuery.of(context).size.width*0.10,
                    right: MediaQuery.of(context).size.width*0.10,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(top:10, bottom:10),
                          child: Text('Profile', style: TextStyle(fontSize:25, fontWeight: FontWeight.bold, color: Colors.blue),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: navpane.navTab(context, _currentIndex),
    );
  }
  /*Widget _navTab(BuildContext context, int ind) {
    return BottomNavigationBar(
      backgroundColor: Colors.white60,
      selectedItemColor: Colors.green,
      currentIndex: ind,
      onTap: (int index) {
        if (index == 0)
          Navigator.pushNamed(context, '/');
        else if (index == 1)
          Navigator.pushNamed(context, '/profile');
        else if (index == 2)
          Navigator.pushNamed(context, '/login');
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: new Icon(Icons.home), label: 'Home',),
        BottomNavigationBarItem(
          icon: new Icon(Icons.account_circle_outlined), label: 'Profile',),
        BottomNavigationBarItem(
          icon: new Icon(Icons.login_rounded), label: 'LogIn',),
      ],
    );
  }*/
}