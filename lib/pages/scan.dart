import 'package:flutter/material.dart';

class Scan extends StatelessWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFFE9DBC7),
        body: Center(
            child: Text('Scan')
        )
    );
  }
}