import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reminders extends StatelessWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE9DBC7),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text("Dos and Don\'ts",
            style: TextStyle(color: Color(0xFF6F1D1B),
                fontFamily: 'Montserrat',
                fontWeight:FontWeight.w700),
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6F1D1B),),
          ),
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'REMINDERS!!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: '1. '),
                    TextSpan(
                      text: 'Cancellation/Changing Schedule Tour',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: ' must be made before the Day of Tour.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: '2. '),
                    TextSpan(
                      text: 'Wear Proper Attire! \n',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                        text: 'Prohibited: sandals, sleeveless clothes, short skirts, jersey shorts.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: '3. '),
                    TextSpan(
                      text: ' Do not bring food and drinks ',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                        text: 'inside the building.'),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}

