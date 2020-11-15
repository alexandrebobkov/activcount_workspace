import 'package:activcount_workspace/services/sign_in.dart';
import 'package:activcount_workspace/src/views/login_page_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {

  final String userName;
  final User user;

  UserProfile({Key key, this.user, this.userName});

  @override
  _UserProfileState createState() => new _UserProfileState();
}
class _UserProfileState extends State<UserProfile> {
  /*@override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(widget.userName.toString()),
    );
  }*/

  @override
  Widget build(BuildContext context) {

    String userName = "Welcome Alex!";

    return Scaffold(
      body: Stack(
        children: <Widget> [
          Container (
            decoration:
            BoxDecoration (
              image: DecorationImage(
                image: AssetImage('assets/patterns/hinterrhein.png'),
                //image: AssetImage('assets/patterns/waiau.png'),
                fit: BoxFit.cover,),),
          ),
          SingleChildScrollView (
            child: Column(
              children: <Widget> [
                Container (
                  width: (MediaQuery.of(context).size.width/5)*5,
                  //height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height/15,
                    bottom: MediaQuery.of(context).size.height/15,
                    left: MediaQuery.of(context).size.width/15,
                    right: MediaQuery.of(context).size.width/10,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(widget.userName.toString(),
                            style: GoogleFonts.artifika(
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontSize: 24,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column (
                            children: <Widget> [
                              Container (
                                decoration: BoxDecoration (
                                  border: Border.all(color: Colors.blueGrey, width: 1.5),
                                  //borderRadius: BorderRadius.circular(30),
                                ),
                                child: Image.network(widget.user.photoURL),
                              ),

                              Row (
                                children: <Widget> [
                                  Expanded (child: Center (child: Text("User name:"),),),
                                  Expanded (child: Center (child: Text(widget.user.displayName),),),
                                ],
                              ),
                              Row (
                                children: <Widget> [
                                  Expanded (child: Center (child: Text("E-mail:"),),),
                                  Expanded (child: Center (child: Text(widget.user.email.toLowerCase().toString()),),),
                                ],
                              ),
                              /*Row (
                                children: <Widget> [
                                  Expanded (child: Center (child: Text("Phone Number:"),),),
                                  Expanded (child: Center (child: Text(widget.user.phoneNumber.toString()),),),
                                ],
                              ),*/
                              Row (
                                children: <Widget> [
                                  Expanded (child: Center (child: Text(""),),),
                                  Expanded (child: Center (child: Text(""),),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding (
                          padding: const EdgeInsets.all(10),
                          child: Container (
                            /*decoration: BoxDecoration (
                              border: Border.all(color: Colors.blueGrey, width: 1.5),
                              borderRadius: BorderRadius.circular(30),
                            ),*/
                            child: _signOutButton(context),
                          ),
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
    );
  }

  Widget _signOutButton(BuildContext cont) {
    return FlatButton(
      splashColor: Colors.green,
      color: Colors.green[300],
      onPressed: () {
        signOutGoogle().then((result) {
          Navigator.of(cont).push(
            MaterialPageRoute(
              builder: (context) {
                return LoginPage2();
              },
            ),
          );
        });
      },

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                child: Text(
                  'Sign Out',
                  style: GoogleFonts.jura(
                    textStyle: Theme.of(cont).textTheme.bodyText1,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool loggedInStatus = true;
    // if user is not logged-in, then display simple view
    if (!loggedInStatus) {
      return Scaffold(
        body: Center(
          child: Column(
            children: <Widget> [
              Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                child: Text(
                  "Please log-in to access this page.",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      );
    }
    else {
      String userName = "Welcome Alex!";

      return Scaffold(
        body: Stack(
          children: <Widget> [
            Container (
              decoration:
              BoxDecoration (
                image: DecorationImage(
                  image: AssetImage('assets/graphics/guy_workdesk_01.png'),
                  fit: BoxFit.cover,),),
            ),
            SingleChildScrollView (
              child: Column(
                children: <Widget> [
                  Container (
                    width: (MediaQuery.of(context).size.width/5)*4,
                    //height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.05,
                      bottom: MediaQuery.of(context).size.height*0.05,
                      left: MediaQuery.of(context).size.width/5,
                      //right: MediaQuery.of(context).size.width*0.10,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget> [
                          Padding(

                            padding: const EdgeInsets.all(10),
                            child: Text(userName,
                              style: GoogleFonts.artifika(
                                textStyle: Theme.of(context).textTheme.bodyText1,
                                fontSize: 24,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          Padding (
                            padding: const EdgeInsets.all(10),
                            child: _signOutButton(context),
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
      );
    }// end if
  }

  Widget _signOutButton(BuildContext cont) {
    return FlatButton(
      splashColor: Colors.green,
      color: Colors.green[300],
      onPressed: () {
        signOutGoogle().then((result) {
          Navigator.of(cont).push(
            MaterialPageRoute(
              builder: (context) {
                return LoginPage2();
              },
            ),
          );
        });
      },

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'Sign Out',
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