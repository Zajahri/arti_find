import 'package:arti_find/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';


class LoginPage extends StatelessWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE9DBC7),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('img/logo.png'),
                      radius: 100,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      "Welcome back!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(color: Color(0xFF6F1D1B), fontSize: 35, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      "Login to your account",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(color: Color(0xFF6F1D1B), fontSize: 20,fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 80.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Enter valid email'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6F1D1B),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const FirstScreen()));
                          },
                          child: const Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Color(0xFFE9DBC7),fontFamily: 'Montserrat', fontSize: 20, fontWeight:FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignupPage()),
                        );
                      },
                      child: const Text("Don't have account? Create new account"
                      ),

                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}


class SignupPage extends StatelessWidget {

  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE9DBC7),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('img/logo.png'),
                      radius: 100,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      "Welcome!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(color: Color(0xFF6F1D1B), fontSize: 35, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      "Create your account",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(color: Color(0xFF6F1D1B), fontSize: 20,fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            hintText: 'Create username'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Enter valid email'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                            hintText: 'Enter secure password'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6F1D1B),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                          },
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Color(0xFFE9DBC7),fontFamily: 'Montserrat', fontSize: 20, fontWeight:FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
              ],),
            ),
            ],
          ),
        )
    );
  }
}

