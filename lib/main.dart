import 'package:arti_find/pages/home_page.dart';
import 'package:arti_find/pages/profile.dart';
import 'package:arti_find/pages/settings.dart';
import 'package:arti_find/pages/scan.dart';
import 'package:flutter/material.dart';
import 'navBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:arti_find/pages/splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int index = 0;

  final screens = [
    const Home(),
    // const HistoryScan(),
    const Scan(),
    // const Favorites(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.home,
            color: Color(0xFF6F1D1B),
          ),
          Text(
            'Home',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF6F1D1B),
            ),
          ),
        ],
      ),
      GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FaIcon(
              FontAwesomeIcons.expand,
              size: 30,
              color: Color(0xFF6F1D1B),
            ),
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.person,
            color: Color(0xFF6F1D1B),
          ),
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF6F1D1B),
            ),
          ),
        ],
      ),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          'ArtiFind',
          style: GoogleFonts.montserrat(
            color: const Color(0xFF6F1D1B),
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF6F1D1B)),
      ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 400),
        height: 60,
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
