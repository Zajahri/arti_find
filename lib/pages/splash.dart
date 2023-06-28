import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      navigateToLoginPage();
    });
  }

  void navigateToLoginPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const FirstScreen()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9DBC7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/svf.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            const Image(
              image: AssetImage('img/byb1.png'),
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
