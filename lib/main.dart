// Author: Alexandre Bobkov

// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`. [Counter] does
/// _not_ depend on Provider.
class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'activcount Workdesk Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// Hi Adi!
// Going to show you my coding in progress.
// Hope recording works :0

// LOVE YOU! :*
// K, LET'S GO!

// As I type a code, the virtual Android should change it's display.
// now will add content.

// k, got the cover image up!
// texting to you now :)

// IT WORKS!
// Layout is one I'm gonna use
// Programm recognizes my clicks
// Let's add bottom navigation pane

// Next step is to program click behaviours for those 2 navigation button.

// That's it for now :*

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Stack (
        children: <Widget> [
          Container (
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView (
            child: Column (
              children: <Widget> [
                Container (
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.15,
                    bottom: MediaQuery.of(context).size.width*0.20,
                    left: MediaQuery.of(context).size.width*0.05,
                    right: MediaQuery.of(context).size.width*0.05,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:0, bottom:0),
                    child: Card (
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          Padding (
                            padding: const EdgeInsets.only(top:10, bottom:10, left:20, right:20),
                            child: Text('Welcome', style: TextStyle(fontSize:25, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          Padding (
                            padding: const EdgeInsets.only(top:10, bottom:10, left:20, right:20),
                            child: Text('You pushed the button this many times:', style: TextStyle(fontSize:16, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          Padding (
                            padding: const EdgeInsets.only(top:10, bottom:10, left:20, right:20),
                            child: Consumer <Counter> (
                              builder: (context, counter, child) => Text ('${counter.value}', style: Theme.of(context).textTheme.headline1,),
                            ),
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
          var counter = context.read<Counter>();
          counter.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
  /*@override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Stack(
        children: <Widget> [
          Container (
            decoration: BoxDecoration (
              image: DecorationImage (
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
            SingleChildScrollView (
              child: Column (
                children: <Widget> [
                  Container (
                    decoration: BoxDecoration (
                      image: DecorationImage (
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                  Container (
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.15,
                    bottom: MediaQuery.of(context).size.width*0.15
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, bottom:0),
                      child: Card (
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        child: Column (
                          children: <Widget> [
                            Padding (
                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20.0, right: 20.0),
                              child:
                              Text ('Welcome', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
                            ),
                            Padding (
                              padding: const EdgeInsets.all(5.0),
                              child:
                              Text ('You have pushed the button this many times:', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),),
                            ),
                            Padding (
                              padding: const EdgeInsets.all(5.0),
                              //child: _signOutButton(context),
                            ),
                            Padding (
                              padding: const EdgeInsets.all(5.0),
                              child: Consumer<Counter>(
                                builder: (context, counter, child) => Text(
                                  '${counter.value}',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ) ,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }*/

  /*Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Flutter Demo Home Page'),),
      body: Container (
        decoration: BoxDecoration(
          image: DecorationImage (
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center (
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Padding (
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20.0, right: 20.0),
                child: Text (
                  'Welcome',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),

              ),
              Padding (
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20.0, right: 20.0),
                child: Text (
                  'You have pushed the button this many times:',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            // Consumer looks for an ancestor Provider widget
            // and retrieves its model (Counter, in this case).
            // Then it uses that model to build widgets, and will trigger
            // rebuilds if the model is updated.
              Consumer<Counter>(
                  builder: (context, counter, child) => Text(
                    '${counter.value}',
                    style: Theme.of(context).textTheme.headline1,
                    ),
              ),
              ],
          ),
        ),
      ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
              // You can access your providers anywhere you have access
              // to the context. One way is to use Provider<Counter>.of(context).
              //
              // The provider package also defines extension methods on context
              // itself. You can call context.watch<Counter>() in a build method
              // of any widget to access the current state of Counter, and to ask
              // Flutter to rebuild your widget anytime Counter changes.
              //
              // You can't use context.watch() outside build methods, because that
              // often leads to subtle bugs. Instead, you should use
              // context.read<Counter>(), which gets the current state
              // but doesn't ask Flutter for future rebuilds.
              //
              // Since we're in a callback that will be called whenever the user
              // taps the FloatingActionButton, we are not in the build method here.
              // We should use context.read().
              var counter = context.read<Counter>();
              counter.increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle_outlined),
            label: 'Profile',
            ),
          ],
      ),
    );
  }*/
