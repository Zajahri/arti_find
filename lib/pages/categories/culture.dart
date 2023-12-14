import 'package:flutter/material.dart';

class CulturePage extends StatelessWidget {
  const CulturePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Arts & Culture',
          style: TextStyle(
            color: Color(0xFF6F1D1B),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF6F1D1B),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'img/culture.png',
              width: 400,
              height: 300,
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: const Text(
                'Did you know that the traditional Binasuan folk dance originated within Bayambang? The Pangkat Kawayan, a local band of players whose instruments are solely made of native bamboo, are testament to the town\'s trailblazing nature. From musicians, artists and filmmakers, Bayambang boasts wealth in all manners of arts, music, and culture.',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6F1D1B),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: 1.8,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFE9DBC7),
    );
  }
}
