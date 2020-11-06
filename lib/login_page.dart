import 'package:activcount_workspace/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar (
        centerTitle: true,
        title: Text('activcount | Workspace Assistant',
          style: TextStyle(fontFamily: 'RobotoMono'),
        ),
      ),*/
      body: Container (
        decoration: BoxDecoration(
          image: DecorationImage (
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container (
                height: 200,
                width: 200,
                decoration: BoxDecoration (
                    image: DecorationImage(image:AssetImage('assets/google_logo.png'),),
                ),
              ),
              //BizLogo(),
              //FlutterLogo(size: 150),
              //SizedBox(height: 60),
              _signInButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }


  Widget _signInButton() {
    return FlatButton(
      splashColor: Colors.green,
      color: Colors.white,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //highlightElevation: 0,
      //borderSide: BorderSide(color: Colors.red),
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
                'Sign in with Google',
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

/*class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue[100]),
    );
  }
}*/