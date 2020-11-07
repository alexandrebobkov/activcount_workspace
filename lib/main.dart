// Author: Alexandre Bobkov

// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'activcount Workdesk Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}

// This is the stateful widget that the main application instantiates.
class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

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
  int _selectedIndex = 0;
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
    setState(() {
      _selectedIndex = index;
    });
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
        onPressed: (){
          var counter = context.read<Counter>();
          counter.increment();
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
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
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


class LoginPage extends StatelessWidget {
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
            SingleChildScrollView (),
            ],
        ),
    );
  }
}
