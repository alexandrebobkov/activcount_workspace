import 'package:flutter/material.dart';

class ProfileError extends StatelessWidget {

  final bool loggedInStatus = false ;
  @override
  Widget build(BuildContext context) {
    // if user is not logged-in, then display simple view
    if (!loggedInStatus) {
      return Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 300,
            width: 300,
            child: Text(
              "Please log-in to access this page.",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            color: Colors.blue,
          ),
        ),
      );
    }
    else {
      return Scaffold(
        body: Center(
          child: Container(
            decoration:
            BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/graphics/guy_workdesk_01.png'),
                fit: BoxFit.cover,),
            ),
            alignment: Alignment.center,
            height: 300,
            width: 300,
            child: Text(
              "",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            //color: Colors.blue,
          ),
        ),
      );
    }// end if
  }
}