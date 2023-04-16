import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:arti_find/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const LoginPage(),),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('img/logo.png'),
              radius: 100,
            ),
            const SizedBox(height: 50.0),
            Text(
              "Balon Bayambang Museum: Home of Innovation",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(color: Color(0xFF6F1D1B), fontSize: 40,fontWeight: FontWeight.w700, ),
              ),
            ),
            const SizedBox(height: 100.0),
            const CupertinoActivityIndicator(
              radius: 20,
              color: Color(0xFF6F1D1B),
            ),
          ],
        ),
      ),
    );
  }
}

