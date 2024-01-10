import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pm_member/pages/chat/chat_page.dart';
import 'package:pm_member/pages/home/home_page.dart';
// import 'package:pm_member/pages/history_page.dart'; // Import your additional page here
// import 'package:pm_member/pages/profile_page.dart';

import '../pages/history/history_page.dart';
import '../pages/profile/profile_page.dart'; // Import your additional page here

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ChatPage(),
    HistoryPage(), // Add an additional page here
    ProfilePage(), // Add an additional page here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width * 0.06;
    final double fontSize = MediaQuery.of(context).size.width * 0.03;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      ),
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                height: iconSize,
                width: iconSize,
                color: _selectedIndex == 0 ? Colors.pink : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/chat.svg',
                height: iconSize,
                width: iconSize,
                color: _selectedIndex == 1 ? Colors.pink : Colors.grey,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/history.svg',
                height: iconSize,
                width: iconSize,
                color: _selectedIndex == 2 ? Colors.pink : Colors.grey,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/user.svg',
                height: iconSize,
                width: iconSize,
                color: _selectedIndex == 3 ? Colors.pink : Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: fontSize,
          unselectedFontSize: fontSize,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
