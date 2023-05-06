import 'package:arti_find/main.dart';
import 'package:arti_find/pages/feedback_form.dart';
import 'package:arti_find/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pages/about_page.dart';
import 'pages/login_page.dart';
import 'pages/reservation.dart';

class NavBar extends StatelessWidget {
  static final DateTime _pickedDate = DateTime.now();

  const NavBar({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 250,
        child: Drawer(
          backgroundColor: const Color(0xFFE9DBC7),
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('ArtFind'),
                accountEmail: Text('Bayambang Municipal Museum'),
                currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                        child: Image(
                  image: AssetImage('img/profilePic.jpg'),
                  fit: BoxFit.cover,
                ))),
                decoration: BoxDecoration(
                  color: Color(0xFF6F1D1B),
                ),
              ),
              ListTile(
                leading: const FaIcon(FontAwesomeIcons.house, size: 20,),
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstScreen()),
                  );
                },
              ),
              ListTile(
                leading: const FaIcon(FontAwesomeIcons.calendar, size: 20,),
                title: const Text('Reservation'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Reservation(initialDate: _pickedDate ?? DateTime.now())
                    ),
                  );
                },
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.infoCircle),
                title: const Text('About'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                },
              ),
              ListTile(
                leading: const FaIcon(FontAwesomeIcons.comment),
                title: const Text('Feedback Form'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FeedBack()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, size: 20,),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
              ),
              const SizedBox(
                height: 320,
              ),
              ListTile(
                leading: const Icon(Icons.logout, size: 20,),
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
