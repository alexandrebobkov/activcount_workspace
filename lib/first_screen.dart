import 'package:flutter/material.dart';

import 'login_page.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.green[100],
        child: Center(
          child: Column(
            children: <Widget>[
              BizLogo(),
              _signOutButton(),
            ],
          ),

        ),
      ),
    );
  }

  Widget _signOutButton() {
    return OutlineButton(
      splashColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      borderSide: BorderSide(color: Colors.red),
      onPressed: () {
        //Navigator.of(context).push(
          MaterialPageRoute(
            // FIX: return to first screen when clicked + logout
            builder: (context) {
              return FirstScreen();
            },
          );
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