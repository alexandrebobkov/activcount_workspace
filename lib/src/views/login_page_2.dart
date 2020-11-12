import 'package:activcount_workspace/services/sign_in.dart';
import 'package:activcount_workspace/src/views/profile.dart';
import 'package:activcount_workspace/src/views/profile_error.dart';
import 'package:flutter/material.dart';

class LoginPage2 extends StatelessWidget {
  final int currentIndex = 0;
  //final navpane = new NavPane();

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
                        _signInButton(context),
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

  Widget _signInButton(BuildContext cont) {

    return FlatButton(
      splashColor: Colors.green,
      color: Colors.white,
      onPressed: () {
        signInWithGoogle().then((result) {
          // if login is successful then load Profile view
          if (result != null) {
            Navigator.of(cont).push(
              MaterialPageRoute(
                builder: (context) {
                  return Profile();
                },
              ),
            );
          }
          else {
            Navigator.of(cont).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProfileError();
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
            //Image(image: AssetImage("assets/google_logo.png"), height: 40.0),
            Image(image: AssetImage("assets/graphics/couple_001.png"), height: 40.0),
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