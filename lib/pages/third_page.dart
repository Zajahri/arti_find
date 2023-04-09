import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE9DBC7),
        automaticallyImplyLeading: false,
        leadingWidth: 65,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6F1D1B),),

          style: ElevatedButton.styleFrom(
             elevation: 0,
             backgroundColor: Colors.transparent,
         ),
        ),
      ),
      body: const Center(
        child: Text('ThirdPage')
      )
    );
  }
}