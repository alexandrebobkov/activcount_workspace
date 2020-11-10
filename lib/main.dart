// Author: Alexandre Bobkov

// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
/*class MyScore with ChangeNotifier {
  int cnt = 0;

  void increase() {
    cnt++;
    notifyListeners();
  }
  void decrease() {
    cnt--;
    notifyListeners();
  }

}
*/
class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}

class CounterState extends State<MyCounter> {

  int cnt = -1;

  @override
  Widget build(BuildContext context) {

    return Text('$cnt', style: Theme.of(context).textTheme.headline1);
  }

  void increase() {
    cnt ++;
  }
}
class MyCounter extends StatefulWidget {
  @override
  CounterState createState() => CounterState();
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
      bottomNavigationBar: navpane.navTab(context, currentIndex),
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
      bottomNavigationBar: navpane.navTab(context, currentIndex),
    );
  }
}