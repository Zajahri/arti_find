import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController pageController;
  int pageNo = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 5) {
        pageNo = 0;
        pageController.jumpToPage(pageNo);
      } else {
        pageNo++;
        pageController.animateToPage(
          pageNo,
          duration: const Duration(seconds: 1),
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Welcome!',
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),
            SizedBox(
              height: 250,
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
                      horizontal: 4,
                      vertical: 25,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'header/header${index + 1}.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
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
            const SizedBox(height: 20.0),
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
            const SizedBox(height: 20.0),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(
                      icon: Icons.brush,
                      backgroundColor: Colors.white,
                      label: 'Culture&Arts',
                    ),
                    SizedBox(width: 18),
                    CategoryItem(
                      icon: Icons.school,
                      backgroundColor: Colors.white,
                      label: 'Education',
                    ),
                    SizedBox(width: 18),
                    CategoryItem(
                      icon: Icons.grass,
                      backgroundColor: Colors.white,
                      label: 'Agriculture',
                    ),
                    SizedBox(width: 18),
                    CategoryItem(
                      icon: Icons.museum,
                      backgroundColor: Colors.white,
                      label: 'History',
                    ),
                    SizedBox(width: 18),
                    CategoryItem(
                      icon: Icons.lightbulb,
                      backgroundColor: Colors.white,
                      label: 'Innovation',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final String label;

  const CategoryItem({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF6F1D1B), // Updated icon color
            size: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

