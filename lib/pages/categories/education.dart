import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Education',
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
              'img/educ.png',
              width: 360,
              height: 300,
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: const Text(
                'Bayambang has long been a trailblazer in the educational sector, serving as the training hub for some of the Philippines\' best educators, spanning primary, secondary, and tertiary levels. Diverse new developments and programs continue to ensure that Bayambang\'s students launch into successful careers.',
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
