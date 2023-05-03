import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        backgroundColor: Color(0xFFE9DBC7),

        body: Center(
            child: Text('Settings')
        )
    );
  }
}