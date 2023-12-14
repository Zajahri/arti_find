import 'package:flutter/material.dart';

class AgriculturePage extends StatelessWidget {
  const AgriculturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Agriculture',
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
              'img/agri.png',
              width: 400,
              height: 300,
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: const Text(
                'Filipino farmers have been cultivating the rich and fertile lands of Bayambang since the Spanish colonization. An agricultural town, Bayambang is considered the "cornbelt of Pangasinan" and the "onion capital of Pangasinan." Bayambang continues to cultivate its rich history through technological innovations and modernizations in the sector.',
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
