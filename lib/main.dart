import 'package:flutter/material.dart';
import 'package:smart_home/pages/security_page.dart';
import 'pages/scenes_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/onboarding/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Urbanist', // lokal font
        useMaterial3: true,
      ),

      // Rute awal aplikasi
      initialRoute: '/home',

      // Daftar semua halaman
      routes: {
        '/': (context) => const OnboardingPage(),
        '/home': (context) => const HomePage(),
        '/scenes': (context) => const ScenesPage(),
        '/security': (context) => const SecurityPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
