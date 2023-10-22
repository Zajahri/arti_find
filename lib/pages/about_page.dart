import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'img/lgu.png',
                  height: screenHeight * 0.1,
                ),
                const SizedBox(width: 30),
                Image.asset(
                  'img/muse.png',
                  height: screenHeight * 0.1,
                ),
                const SizedBox(width: 30),
                Image.asset(
                  'img/tour.png',
                  height: screenHeight * 0.1,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 17.0,
                    height: 2,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: "\tUnder the leadership of ",
                    ),
                    TextSpan(
                      text: "Cezar T. Quiambao, ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "the Bayambang Municipal Museum was first conceptualized in 2011 and "
                          "later pursued in 2016. Under ",
                    ),
                    TextSpan(
                      text: "Mayor Nina Jose-Quiambao's ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                      "leadership, the museum opened to the public on February 15, 2023, after years of hard work and dedication culminated in a soft opening on October 21, 2022.",
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
                softWrap: true, // Allow text to wrap to the next line if it doesn't fit
              ),
            ),

            SizedBox(height: screenHeight * 0.005),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
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
            SizedBox(height: screenHeight * 0.001),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone, color: Color(0xFF6F1D1B), size: 20),
                      SizedBox(width: 10),
                      Text(
                        "Phone: 09661734240",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 19.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.facebook, color: Color(0xFF6F1D1B), size: 20),
                      SizedBox(width: 10),
                      Text(
                        "Facebook: Balon Bayambang",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 19.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Color(0xFF6F1D1B), size: 20),
                      SizedBox(width: 10),
                      Text(
                        "Address: Bayambang Municipal \nPlaza, Brgy. Zone 2, Bayambang, \nPangasinan",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 19.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GoogleMap()));
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF6F1D1B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  "View on map",
                  style: TextStyle(
                    color: Color(0xFFE9DBC7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
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
        initialUrl: 'https://www.google.com/maps/place/Municipal+Museum/@15.8094731,120.4562875,19z/data=!4m15!1m8!3m7!1s0x3391495264dbc2b5:0xeb854dcfed99de7f!2sMunicipal+Museum!8m2!3d15.809524!4d120.456408!10e5!16s%2Fg%2F11s5s64mt0!3m5!1s0x3391495264dbc2b5:0xeb854dcfed99de7f!8m2!3d15.809524!4d120.456408!16s%2Fg%2F11s5s64mt0?entry=ttu',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}