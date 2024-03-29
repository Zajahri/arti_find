import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'categories/agri.dart';
import 'categories/culture.dart';
import 'categories/education.dart';
import 'categories/history.dart';
import 'categories/innov.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController pageController;
  int pageNo = 0;

  ///////////////url/////////////////////
  final Uri _uri = Uri(scheme: 'http', host: '192.168.1.137', port: 5173);
  Future<void> _launchUrl() async {
    if (!await launchUrl(_uri)) {
      throw Exception('Could not launch $_uri');
    }
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (pageNo == 3) {
        pageNo = 0;
        pageController.jumpToPage(pageNo);
      } else {
        pageNo++;
        pageController.animateToPage(
          pageNo,
          duration: const Duration(seconds: 5),
          curve: Curves.easeInOutCirc,
        );
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  pageNo = index;
                });
              },
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 20,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: SizedBox(
                        width: 380,
                        height: 300,
                        child: Stack(
                          children: [
                            Image.asset(
                              'header/header${index + 1}.jpg',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(
                                children: [
                                  if (index == 0)
                                    Positioned(
                                      bottom: 60,
                                      child: Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          'Welcome to \n Bayambang Municipal \n Museum!',
                                          style: GoogleFonts.montserrat(
                                            color: Color(0xFF6F1D1B),
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (index == 1)
                                    Positioned(
                                      bottom: 50,
                                      left: 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF6F1D1B).withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          "Plan your visit \n for a great experience!",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (index == 2)
                                    Positioned(
                                      bottom: 78,
                                      left: 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF6F1D1B).withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          "Explore art and history \n with our Image Recognition!",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
                  (index) => Container(
                margin: const EdgeInsets.all(2.0),
                child: Icon(
                  Icons.circle,
                  size: 12.0,
                  color: pageNo == index
                      ? const Color(0xFF6F1D1B)
                      : Colors.grey.shade400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Categories',
              style: GoogleFonts.montserrat(
                color: Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryItem(
                    icon: Icons.brush,
                    backgroundColor: Colors.white,
                    label: 'Culture',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CulturePage(),
                      ));
                    },
                  ),
                  SizedBox(width: 30),
                  CategoryItem(
                    icon: Icons.school,
                    backgroundColor: Colors.white,
                    label: 'Education',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EducationPage(),
                      ));
                    },
                  ),
                  SizedBox(width: 30),
                  CategoryItem(
                    icon: Icons.grass,
                    backgroundColor: Colors.white,
                    label: 'Agriculture',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AgriculturePage(),
                      ));
                    },
                  ),
                  SizedBox(width: 30),
                  CategoryItem(
                    icon: Icons.museum,
                    backgroundColor: Colors.white,
                    label: 'History',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HistoryPage(),
                      ));
                    },
                  ),
                  SizedBox(width: 30),
                  CategoryItem(
                    icon: Icons.lightbulb,
                    backgroundColor: Colors.white,
                    label: 'Innovation',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const InnovationPage(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Book an Appointment',
              style: GoogleFonts.montserrat(
                color: Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "Book Now to secure your spot at our museum and enjoy an unforgettable experience. Click the button below to avoid queues and delays.",
              style: GoogleFonts.montserrat(
                color: Colors.black87,
                fontSize: 17.0,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 15.0),
          Center(
            child: Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                color: const Color(0xFF6F1D1B),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    _launchUrl();
                    // Handle the book now button click
                  },
                  child: const Center(
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        color: Color(0xFFE9DBC7),
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final String label;
  final VoidCallback? onTap;

  const CategoryItem({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            child: Icon(
              icon,
              color: const Color(0xFF6F1D1B),
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 60,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}