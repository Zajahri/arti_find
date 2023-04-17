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
        initialUrl: 'https://www.google.com/maps/place/Municipal+Museum/@15.809524,120.456408,3a,75y,90t/data=!3m11!1e2!3m9!1sAF1QipPFtoXku_qlfthU419uRoxIya1t42LhOy-uwE-6!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipPFtoXku_qlfthU419uRoxIya1t42LhOy-uwE-6%3Dw203-h152-k-no!7i1600!8i1200!9m2!1b1!2i55!4m9!3m8!1s0x3391495264dbc2b5:0xeb854dcfed99de7f!8m2!3d15.809524!4d120.456408!10e5!14m1!1BCgIgARICGAI!16s%2Fg%2F11s5s64mt0',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}