import 'package:arti_find/pages/fav.dart';
import 'package:arti_find/pages/fifth_page.dart';
import 'package:arti_find/pages/settings.dart';
import 'package:arti_find/pages/seventh_page.dart';
import 'package:arti_find/pages/sixth_page.dart';
import 'package:flutter/material.dart';
import 'navBar.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main(){
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

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Timer(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const FirstScreen(),),
        );
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("img/logo.png"),
              const SizedBox(height: 10), // add some spacing between the image and progress indicator
              const CupertinoActivityIndicator(
                radius: 20,
                color: Color(0xFF6F1D1B),
              ),
            ],
          ),
        ),
      );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() =>_FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int index = 2;

  final screens = [
    const FifthPage(),
    const SixthPage(),
    const SeventhPage(),
    const Favorites(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.center,children: const [
            Icon(Icons.home,color: Color(0xFF6F1D1B),),
            Text('Home',style: TextStyle(fontSize: 12,color: Color(0xFF6F1D1B),),),],),
        Column(mainAxisAlignment: MainAxisAlignment.center,children: const [
            FaIcon(FontAwesomeIcons.clockRotateLeft,color: Color(0xFF6F1D1B),),
            Text('History',style: TextStyle(fontSize: 12,color: Color(0xFF6F1D1B),),),],),
        Column(mainAxisAlignment: MainAxisAlignment.center,children: const [
            FaIcon(FontAwesomeIcons.expand ,size: 30, color: Color(0xFF6F1D1B), ),
            Text('', style: TextStyle( fontSize: 12, color: Color(0xFF6F1D1B),),),],),
        Column(mainAxisAlignment: MainAxisAlignment.center,children: const [
            Icon(Icons.favorite,color: Color(0xFF6F1D1B),),
            Text('Favorite',style: TextStyle(fontSize: 12,color: Color(0xFF6F1D1B),),),],),
        Column(mainAxisAlignment: MainAxisAlignment.center,children: const [
            Icon(Icons.settings,color: Color(0xFF6F1D1B),),
            Text('Settings',style: TextStyle(fontSize: 12,color: Color(0xFF6F1D1B),),),],),];

    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text(
          'ArtFind',
          style: TextStyle(color: Color(0xFF6F1D1B)),
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
        animationDuration: const Duration(milliseconds: 300),
        height: 60,
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
        ),
    );
  }
}








