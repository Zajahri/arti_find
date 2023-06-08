import 'package:flutter/material.dart';

class Scan extends StatelessWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE9DBC7),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text("",
            style: TextStyle(color: Color(0xFF6F1D1B),
                fontFamily: 'Montserrat',
                fontWeight:FontWeight.w700),
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6F1D1B),),
          ),
        ),
        body: const Center(
            child: Text('')
        )
    );
  }
}