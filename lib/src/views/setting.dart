//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: Text("Settings",
              style: GoogleFonts.artifika(
                textStyle: Theme.of(context).textTheme.bodyText1,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
              /*style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),*/
            ),
          )),
    );
  }
}