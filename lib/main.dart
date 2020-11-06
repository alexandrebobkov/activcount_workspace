// Author: Alexandre Bobkov

import 'package:activcount_workspace/login_page.dart';
import 'package:activcount_workspace/pages/LandingPage.dart';
import 'package:activcount_workspace/routing_values.dart';
import 'package:activcount_workspace/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyWorkspace());
}

class MyWorkspace extends StatefulWidget {
  @override
  _MyWorkspaceAssistant createState() => new _MyWorkspaceAssistant();
}

class _MyWorkspaceAssistant extends State<MyWorkspace> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build (BuildContext context) {
    return Provider (
      child: MaterialApp (
        title: "Assistant",
      )
    );
  }
}