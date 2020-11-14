import 'package:activcount_workspace/services/sign_in.dart';
import 'package:activcount_workspace/src/views/profile.dart';
import 'package:activcount_workspace/src/views/profile_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                          child: Text('Log-In',
                            style: GoogleFonts.artifika(
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontSize: 48,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
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
                  //return Text("$result");
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Image(image: AssetImage("assets/google_logo.png"), height: 40.0),
            Image(image: AssetImage("assets/graphics/couple_001.png")),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Sign in with Google',
                style: GoogleFonts.jura(
                  textStyle: Theme.of(cont).textTheme.bodyText1,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}