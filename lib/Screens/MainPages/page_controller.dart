import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masurao/Screens/MainPages/HomePage.dart';
import 'package:masurao/Screens/welcome_page/welcome_page.dart';
import 'ContactPage.dart';
import 'MatchMakePage/MatchMake.dart';

class PageTab extends StatefulWidget {
  // PageTab(this.user);
  // final User user;

  @override
  _PageTabState createState() => _PageTabState();
}

class _PageTabState extends State<PageTab> {
  final List<Widget> tabs = [
    HomePage(),
    MatchPage(),
    ContactPage(),
  ];

  int currentIndex = 0;
  void onTabTappped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('MASURAO For Futsal'),
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //         onPressed: () async {
      //           await FirebaseAuth.instance.signOut();
      //           await Navigator.of(context)
      //               .pushReplacement(MaterialPageRoute(builder: (context) {
      //             return WelcomePage();
      //           }));
      //         },
      //         icon: Icon(Icons.logout))
      //   ],
      // ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTappped,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Match Make',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
