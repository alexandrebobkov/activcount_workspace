import 'dart:ui';
import 'package:activcount_workspace/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_page.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Container(color: Colors.green[100],
      backgroundColor: Colors.grey[200],
      body: Stack (
        children: <Widget>[
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
                // Background image
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
                            child: Text ('Welcome', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          Padding (
                            padding: const EdgeInsets.all(5.0),
                            child: BizLogo(),
                          ),
                          Padding (
                            padding: const EdgeInsets.all(5.0),
                            child: _signOutButton(context),
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

  Widget _signOutButton(BuildContext buildContext) {
    return OutlineButton(
      splashColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      borderSide: BorderSide(color: Colors.red),
      onPressed: () {
        Navigator.of(buildContext).push(
          MaterialPageRoute(
            // FIX: return to first screen when clicked + logout
            builder: (buildContext) {
              signOutGoogle();
              return LoginPage();
            },
          ));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 40.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget BizLogo() {
  return Image(image: AssetImage("assets/google_logo.png"), height: 200);
}