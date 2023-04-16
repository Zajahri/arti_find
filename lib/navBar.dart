import 'package:arti_find/pages/contact_us.dart';
import 'package:arti_find/pages/settings.dart';
import 'package:arti_find/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'pages/second_page.dart';
import 'pages/contact_us.dart';
import 'pages/fourth_page.dart';
import 'pages/login_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

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
                    image: DecorationImage(
                  image: AssetImage('img/bg1.jpg'),
                  fit: BoxFit.cover,
                )),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('secondPage'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Contact Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUs()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.thumb_up),
                title: const Text("Do's and Don'ts"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FourthPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
              ),
              const SizedBox(
                height: 400,
              ),
              ListTile(
                leading: const Icon(Icons.logout),
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
