import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart' as signIn;
import 'package:googleapis/drive/v3.dart' as drive;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

//Future<String> signInWithGoogle() async {
Future<User> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  /*final gDriveSignIn = signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.DriveScope]);
  final signIn.GoogleSignInAccount account = await gDriveSignIn.signIn();
  print("GDrive user account: $account");*/

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  final Map user_profile = authResult.additionalUserInfo.profile;

  if (user != null) {
    final String user_name = authResult.additionalUserInfo.username;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded!!! \n You are: ' +currentUser.displayName +'\n Detailed info: \n' +currentUser.toString());

    //return '$user_name';
    return currentUser;
  }

  getProfileImage() {
    if(_auth.currentUser.photoURL != null) {
      return Image.network(_auth.currentUser.photoURL, height: 100, width: 100);
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }

  return null;
}

Future<String> getUserName() async {
  String userName;

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  userName = user.displayName.toLowerCase();

  return userName;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  //await SignIn.signOut();

  print("User Signed Out");
}
