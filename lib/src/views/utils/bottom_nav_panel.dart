import 'package:activcount_workspace/src/views/login_page_2.dart';
import 'package:activcount_workspace/src/views/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomNavigationPanel extends StatefulWidget {
  @override
  _BottomNavigationPanelState createState() =>
      _BottomNavigationPanelState();
}

class _BottomNavigationPanelState extends State<BottomNavigationPanel> {
  var currentTab = [
    //Home(),
    LandingPage(),
    //LoginPage2(),
    //Profile(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationPanelProvider>(context);
    return Scaffold(
      // Load view with index {currentIndex} from an array currentTab[]
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        unselectedLabelStyle: GoogleFonts.jura(fontSize: 16, fontWeight: FontWeight.bold),
        selectedLabelStyle: GoogleFonts.jura(fontSize: 18, fontWeight: FontWeight.bold),
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          /*BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: 'Profile',
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
    );
  }
}

class BottomNavigationPanelProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}