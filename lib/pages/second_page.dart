import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE9DBC7),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("About",
            style: TextStyle(color: Color(0xFF6F1D1B),fontFamily: 'Montserrat', fontWeight:FontWeight.w700),
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6F1D1B),),
          ),
        ),
      body: Column(
        children: [
          const Text('1st Column'),
          const Text('2nd Column'),
          Row(
            children: const [
              Text('1st Row'),
              Text('2nd Row'),
            ]

          )
        ],
      )

    );
  }
}
