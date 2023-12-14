import 'package:flutter/material.dart';

class InnovationPage extends StatelessWidget {
  const InnovationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Innovation',
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
              'img/innovation.png',
              width: 400,
              height: 300,
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: const Text(
                "Bayambang is home to some of the nation's most innovative, successful, and groundbreaking citizens across different sectors. Since 2018, the Matalunggaring Award is the highest honor given by the Local Government of Bayambang to Bayambangueños whose exceptional achievements are worthy of emulation. This gallery showcases some of our finest and exemplary citizens.",
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
