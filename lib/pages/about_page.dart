import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "About",
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
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'img/lgu.png',
                  height: 80,
                ),
                const SizedBox(width: 30),
                Image.asset(
                  'img/muse.png',
                  height: 80,
                ),
                const SizedBox(width: 30),
                Image.asset(
                  'img/tour.png',
                  height: 80,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    height: 2,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: "\t   Under the leadership of  ",
                    ),
                    TextSpan(
                      text: "Dr. Cezar T. Quiambao, ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "the Bayambang Municipal Museum was first conceptualized in 2011 and "
                          "later pursued in 2016. Under ",
                    ),
                    TextSpan(
                      text: "Mayor Nina Jose-Quiambao's ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "leadership, the museum opened to the public on February 15, 2023, after years of hard work and dedication culminated in a soft opening on October 21, 2022.",
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 5.0),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Contact Us",
                  style: TextStyle(
                    color: Color(0xFF6F1D1B),
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.phone, color: Color(0xFF6F1D1B), size: 20),
                      SizedBox(width: 10),
                      Text(
                        "Phone: 09661734240",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      Icon(Icons.facebook,color: Color(0xFF6F1D1B), size: 20),
                      SizedBox(width: 10),
                      Text(
                        "Facebook: Balon Bayambang",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Color(0xFF6F1D1B), size: 20),
                      SizedBox(width: 10),
                      Text(
                        "Address: Bayambang, Pangasinan",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GoogleMap()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6F1D1B),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  elevation: 4.0,
                ),
                child: const Text("View on map", style: TextStyle(color: Color(0xFFE9DBC7), fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('View on map',
          style: TextStyle(color: Color(0xFF6F1D1B),fontFamily: 'Montserrat', fontWeight:FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6F1D1B),),
        ),
      ),
      body: const WebView(
        initialUrl: 'https://www.google.com/maps/place/Municipal+Museum/@15.809524,120.456408,3a,75y,90t/data=!3m11!1e2!3m9!1sAF1QipPFtoXku_qlfthU419uRoxIya1t42LhOy-uwE-6!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipPFtoXku_qlfthU419uRoxIya1t42LhOy-uwE-6%3Dw203-h152-k-no!7i1600!8i1200!9m2!1b1!2i55!4m9!3m8!1s0x3391495264dbc2b5:0xeb854dcfed99de7f!8m2!3d15.809524!4d120.456408!10e5!14m1!1BCgIgARICGAI!16s%2Fg%2F11s5s64mt0',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}