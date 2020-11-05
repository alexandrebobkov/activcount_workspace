import 'package:activcount_workspace/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

/*Future <LoginPage> _signOut() async {
  await FirebaseAuth.instance.signOut();
  return new LoginPage();
}*/