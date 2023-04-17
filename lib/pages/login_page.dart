import 'package:arti_find/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool passwordObscured = true;

@override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE9DBC7),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 120,
               ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('img/logo.png'),
                      radius: 100,
                    ),
                    const SizedBox(height: 30.0),
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
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Email',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0,2)
                            )
                            ],
                          ),
                          height: 60,
                          child: const TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight:FontWeight.w500),
                            decoration: InputDecoration(
                            border: InputBorder.none,
                              contentPadding:EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.email,
                                color:Color(0xFFeb8c00)
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Colors.black38
                              )
                          ),
                      ),
                    ),

                    const SizedBox(height:10),

                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10.0),

                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0,2)
                          )
                        ],
                      ),
                      height: 60,
                      child: TextField(
                        obscureText: passwordObscured,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 14),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xFFeb8c00),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordObscured = !passwordObscured;
                              });
                            },
                            icon: Icon(
                              passwordObscured ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black54
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height:90),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6F1D1B),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0,2)
                          )
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const FirstScreen()));
                          },
                          child: const Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Color(0xFFE9DBC7),fontFamily: 'Montserrat', fontSize: 20, fontWeight:FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupPage()),
                      );
                    },
                    child: const Text("Don't have an account? Create new account",
                        style: TextStyle(fontFamily: 'Montserrat', fontSize: 17, fontWeight:FontWeight.w500),
                    ),
                  ),
               ],
            ),
          ),
      );
  }
}




