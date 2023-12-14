import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'History',
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
              'img/history.png',
              width: 400,
              height: 300,
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: const Text(
                'The Municipality of Bayambang traces its beginnings to the old pueblo of Malunguey/Balunguey, a riverbank community that had thrived long before the Spaniards came. Throughout the years, Bayambang has flourished and stood resilient amidst wars and troubles, and emerged as a town full of heroes, pioneers, and innovators.',
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
