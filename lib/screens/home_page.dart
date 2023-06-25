
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:heart_app_finallll/screens/profile_screen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../components/records.dart';
import 'contacts_screen.dart';
import 'dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  //late PersistentTabController _controller;


  List pages=[
    Dashboard(),
    Home_Screen(),
    ContactsScreen(),
    ProfileScreen(),
  ];

  void onTapNav(int index){
    setState((){
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade500,
        unselectedLabelStyle: TextStyle(color: Colors.grey.shade500),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart),label: "Records"),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

      )
    );
  }
}