import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:smart_home/pages/scenes_page.dart';
import 'package:smart_home/pages/security_page.dart';
import 'smart_home_page.dart'; // Ganti path jika perlu
import 'profile_page.dart'; // Ganti path jika perlu
import 'package:material_symbols_icons/material_symbols_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const SmartHomePage(),
    const ScenesPage(),
    const SecurityPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Ini background atau halaman kamu
        _pages[_pageIndex], // ini halaman aktif
        // Ini navbar
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, -2), // arah shadow ke atas
                  blurRadius: 30,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: CurvedNavigationBar(
              index: _pageIndex,
              backgroundColor: Colors.transparent,
              color: Color(0xFFF9F9F9), // atau Colors.grey[100]
              animationDuration: const Duration(milliseconds: 300),
              items: const <Widget>[
                Icon(
                  Icons.home_outlined,
                  color: Colors.lightBlueAccent,
                  size: 30,
                ),
                Icon(Symbols.scene, color: Colors.lightBlueAccent, size: 30),
                Icon(
                  Icons.shield_outlined,
                  color: Colors.lightBlueAccent,
                  size: 30,
                ),
                Icon(
                  Icons.person_outline_rounded,
                  color: Colors.lightBlueAccent,
                  size: 30,
                ),
              ],
              onTap: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
