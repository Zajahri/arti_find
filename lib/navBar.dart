import 'package:arti_find/main.dart';
import 'package:arti_find/pages/feedback_form.dart';
import 'package:arti_find/pages/profile.dart';
import 'package:arti_find/pages/scan.dart';
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFE9DBC7),
            ),
            child: Column(
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('img/tao.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                  child: const Text(
                    'Moises Fernandez',
                    style: TextStyle(
                      color: Color(0xFF6F1D1B),
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'example@gmail.com',
                  style: TextStyle(
                    color: Color(0xFF6F1D1B),
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  leading: const FaIcon(FontAwesomeIcons.house, size: 20, color: Color(0xFF6F1D1B)),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FirstScreen()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListTile(
                  leading: const FaIcon(FontAwesomeIcons.calendar, size: 20, color: Color(0xFF6F1D1B)),
                  title: const Text('Reservation'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Reservation(initialDate: _pickedDate ?? DateTime.now()),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListTile(
                  leading: const FaIcon(FontAwesomeIcons.expand, size: 20, color: Color(0xFF6F1D1B)),
                  title: const Text('Scan'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Scan()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  leading: const FaIcon(FontAwesomeIcons.comment, size: 20, color: Color(0xFF6F1D1B)),
                  title: const Text('Feedback Form'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FeedBack()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  leading: const FaIcon(FontAwesomeIcons.infoCircle, size: 20, color: Color(0xFF6F1D1B),),
                  title: const Text('About'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const About()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  leading: const Icon(Icons.settings, size: 20, color: Color(0xFF6F1D1B)),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 260),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  leading: const Icon(Icons.logout, size: 20, color: Color(0xFF6F1D1B)),
                  title: const Text('Log Out'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
  }
}
