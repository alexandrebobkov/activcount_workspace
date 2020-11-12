import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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