import 'package:arti_find/pages/third_page.dart';
import 'package:flutter/material.dart';
import 'pages/second_page.dart';
import 'pages/third_page.dart';
import 'pages/fourth_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
        child: Drawer(
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
                        )
                    )
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('img/bg1.jpg'),
                      fit: BoxFit.cover,

                    )
                ),
              ),

              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('secondPage'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('thirdPage'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThirdPage()
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('fourthPage'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FourthPage()
                    ),
                  );
                },
              ),

            ],
          ),
        ),
    );


  }
}
