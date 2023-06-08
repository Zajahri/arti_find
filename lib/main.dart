import 'package:flutter/material.dart';
import 'navBar.dart';
import 'package:arti_find/pages/home_page.dart';
import 'package:arti_find/pages/profile.dart';
import 'package:arti_find/pages/settings.dart';
import 'package:arti_find/pages/scan.dart';
import 'package:arti_find/pages/splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int routeIndex = 0;
  final List<Widget> _screens = [const Home(), const Profile()];
  void _onItemTapped(int index) => setState(() => routeIndex = index);
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFE9DBC7),
    drawer: const NavBar(),
    appBar: AppBar(
      title: const Text(
        'MuBa',
        style: TextStyle(color: Color(0xFF6F1D1B), fontSize: 30, fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Color(0xFF6F1D1B)),
    ),
    body: _screens[routeIndex],
    bottomNavigationBar: BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => _onItemTapped(0),
              icon: Icon(Icons.home, color: routeIndex == 0 ? const Color(0xFF6F1D1B) : Colors.black),
            ),
            const SizedBox(width: 48.0),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
              icon: Icon(Icons.person, color: routeIndex == 1 ? const Color(0xFF6F1D1B) : Colors.black),
            ),
          ],
        ),
      ),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Scan()),
          );
        },
        backgroundColor: const Color(0xFF6F1D1B),
        child: const FaIcon(FontAwesomeIcons.expand, color: Color(0xFFE9DBC7),),
      ),
    );
  }
