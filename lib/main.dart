
import 'package:arti_find/pages/fifth_page.dart';
import 'package:arti_find/pages/seventh_page.dart';
import 'package:arti_find/pages/sixth_page.dart';
import 'package:flutter/material.dart';
import 'navBar.dart';

void main() {
  return runApp(
    const MaterialApp(
      home: FirstScreen(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() =>_FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0;
  final List _screens = [const FifthPage(), const SixthPage(), const SeventhPage()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('ArtFind'),
        centerTitle: true,
      ),
      body: Center(
         child: _screens[_currentIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: _updateIndex,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue[700],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Hello',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Diamond',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}








