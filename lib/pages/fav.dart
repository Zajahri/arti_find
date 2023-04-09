import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        backgroundColor: Color(0xFFE9DBC7),
        body: Center(
            child: Text('Favorites')
        )
    );
  }
}