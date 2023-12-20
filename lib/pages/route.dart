import 'package:flutter/material.dart';

class Floor extends StatelessWidget {
  const Floor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Route",
          style: TextStyle(
              color: Color(0xFF6F1D1B),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 22
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6F1D1B)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Ground Floor',
              style: TextStyle(
                fontSize: 22,
                height: 2,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6F1D1B),
                fontFamily: 'Montserrat',
              ),
            ),
            const Text(
              ' 1      Featured Exhibition Space \n 2     History Exhibit \n 3     Education Exhibit \n📍   Museum Lobby \n☕   Cafe and Souvenir Shop \n        Administration Office',
              style: TextStyle(
                fontSize: 22,
                height: 2,
                color: Color(0xFF6F1D1B),
                fontFamily: 'Montserrat',
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              width: 600,
              child: Image.asset(
                  'img/gf.png'
              ),
            ),
            const Text(
              '2nd Floor',
              style: TextStyle(
                fontSize: 22,
                height: 2,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6F1D1B),
                fontFamily: 'Montserrat',
              ),
            ),
            const Text(
              ' 4    Persons of Innovation Exhibit \n 5    Agriculture Exhibit \n       Museum Lobby',
              style: TextStyle(
                fontSize: 22,
                height: 2,
                color: Color(0xFF6F1D1B),
                fontFamily: 'Montserrat',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2),
              width: 300,
              child: Image.asset(
                  'img/2F.png'
              ),
            ),
          ],
        ),

      ),
    );
  }
}
