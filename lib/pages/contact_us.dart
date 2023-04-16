import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9DBC7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Contact Us',
          style: TextStyle(color: Color(0xFF6F1D1B),fontFamily: 'Montserrat', fontWeight:FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6F1D1B),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => GoogleMap()));
        },
        child: Icon(Icons.location_on, color: Color(0xFFE9DBC7),),
        backgroundColor: Color(0xFF6F1D1B),
      ),
    );
  }
}

class GoogleMap extends StatelessWidget {
  GoogleMap({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6F1D1B),),
        ),
      ),
      body: WebView(
        initialUrl: 'https://www.google.com/maps/place/Municipal+Museum/@15.8093665,120.4565045,19.75z/data=!4m6!3m5!1s0x3391495264dbc2b5:0xeb854dcfed99de7f!8m2!3d15.809524!4d120.456408!16s%2Fg%2F11s5s64mt0',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}