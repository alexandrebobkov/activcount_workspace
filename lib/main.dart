// Author: Alexandre Bobkov

// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';

import 'package:activcount_workspace/router.dart';
import 'package:activcount_workspace/services/nav_pane.dart';

void main() {
  runApp(
    // Provide the model to all widgets within the app. We're using
    // ChangeNotifierProvider because that's a simple way to rebuild
    // widgets when a model changes. We could also just use
    // Provider, but then we would have to listen to Counter ourselves.
    //
    // Read Provider's docs to learn about all the available providers.
    ChangeNotifierProvider(
      // Initialize the model in the builder. That way, Provider
      // can own Counter's lifecycle, making sure to call `dispose`
      // when not needed anymore.
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'activcount Workdesk Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<BottomNavigationPanelProvider> (
        child: BottomNavigationPanel(),
        //builder: (BuildContext context) => BottomNavigationPanelProvider(),
        create: (context) => BottomNavigationPanelProvider(),
      ),
      //home: LandingPage2(),
      onGenerateRoute: MyRouter().generateRoute,
      initialRoute: '/',
    );
  }
}

class LandingPage2 extends StatelessWidget {
  final int _currentIndex = 1;
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
                          Consumer<Counter>(
                            builder: (context, counter, child) => Text('${counter.value}', style: Theme.of(context).textTheme.headline2,),),
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
          var counter = context.read<Counter>();
          counter.increment();
        },
        child: Icon (Icons.add),
      ),
      bottomNavigationBar: navpane.navTab(context, _currentIndex),
    );
  }
}

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}

class LoginPage2 extends StatelessWidget {
  final int currentIndex = 0;
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
                image: AssetImage('assets/patterns/aare.png'),
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
      //bottomNavigationBar: navpane.navTab(context, currentIndex),
    );
  }
}

class Profile2 extends StatelessWidget {
  final int currentIndex = 0;
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
                image: AssetImage('assets/patterns/waiau.png'),
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
      bottomNavigationBar: navpane.navTab(context, currentIndex),
    );
  }
}

/*enum BottomNavigationType {
  withLabels,
  withoutLabels,
}

class BottomNavigationPanel extends StatefulWidget {
  const BottomNavigationPanel({Key key, @required this.type}) : super(key: key);

  @override
  _BottomNavigationPanelState createState() => _BottomNavigationPanelState();

  final BottomNavigationType type;
}

class _BottomNavigationPanelState extends State<BottomNavigationPanel> {
  int _currentIndex = 0;

  @override
  Widget build (BuildContext context) {
    var bottomNavigationBarItems = <BottomNavigationBarItem> [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home_filled),
        label: "home",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle),
        label: "account",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.login_outlined),
        label: "login",
      ),
    ];
    return BottomNavigationBar(
      backgroundColor: Colors.grey[400],
      selectedItemColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (i) {
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
}*/

class BottomNavigationPanel extends StatefulWidget {
  @override
  _BottomNavigationPanelState createState() =>
      _BottomNavigationPanelState();
}

class _BottomNavigationPanelState extends State<BottomNavigationPanel> {
  var currentTab = [
    //Home(),
    LoginPage2(),
    Profile(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationPanelProvider>(context);
    return Scaffold(
      // Load view with index {currentIndex} from an array currentTab[]
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 300,
            width: 300,
            child: Text(
              "Home",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            color: Colors.amber,
          )),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container (
            decoration:
                BoxDecoration (
                  image: DecorationImage(
                    image: AssetImage('assets/patterns/waiau.png'),
                  fit: BoxFit.cover,),
                ),
            alignment: Alignment.center,
            child: Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          )),
    );
  }
}


class BottomNavigationPanelProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}