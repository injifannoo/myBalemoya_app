import 'package:my_balemoya_app/UI/Settings/settingspage.dart';
import 'package:my_balemoya_app/UI/auth/profile.dart';
import 'package:my_balemoya_app/UI/homepage.dart';
import 'package:my_balemoya_app/UI/my_wallet/mywallet.dart';
import 'package:my_balemoya_app/UI/search/searchpage.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const MyWalletPage(),
    const ProfilePage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double? iconsize;
    double? headersize;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    bool isPortrait = orientaion == Orientation.portrait;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        iconsize = sWidth * 0.06;
        headersize = 16;
      } else {
        iconsize = sWidth * 0.035;
        headersize = 14;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        iconsize = sWidth * 0.05;
        headersize = 16;
      } else {
        headersize = 15;
        iconsize = sWidth * 0.035;
      }
    }

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.home,
            size: iconsize,
            color: Color(kDarkGrey.value),
          ),
          Icon(
            Icons.search,
            size: iconsize,
            color: Color(kDarkGrey.value),
          ),
          Icon(
            Icons.monetization_on_outlined,
            size: iconsize,
            color: Color(kDarkGrey.value),
          ),
          Icon(
            Icons.person_2,
            size: iconsize,
            color: Color(kDarkGrey.value),
          ),
          Icon(
            Icons.more_vert,
            size: iconsize,
          ),
        ],
        backgroundColor: Colors.transparent,
        index: _selectedIndex,
        color: const Color.fromRGBO(255, 250, 250, 1),
        buttonBackgroundColor: const Color.fromRGBO(255, 250, 250, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
