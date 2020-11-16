
import 'package:activcount_workspace/src/views/login_page_2.dart';
import 'package:activcount_workspace/src/views/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'package:activcount_workspace/src/views/setting.dart';

import 'views/utils/bottom_nav_panel.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'activcount | Your Workdesk Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<BottomNavigationPanelProvider> (
        child: BottomNavigationPanel(),
        create: (context) => BottomNavigationPanelProvider(),
      ),
      //onGenerateRoute: MyRouter().generateRoute,
      //initialRoute: '/',
    );
  }
}



