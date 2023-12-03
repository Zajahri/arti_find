import 'dart:io';
import 'dart:ui';
import 'package:arti_find/pages/scan.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultPage extends StatelessWidget {
  final File image;
  final List results;
  final List<String> labels;
  final List<ModelInfo> models;

  const ResultPage({
    Key? key,
    required this.image,
    required this.results,
    required this.labels,
    required this.models,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String appBarTitle = models.isNotEmpty ? models[0].title : "";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(image),
              ),
            ),
          ),
          // Blurred Opacity layer
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          // Content
          Positioned.fill(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    appBarTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Scan()),
                      );
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.times,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).padding.top),
                // Display the image output
                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image,
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (BuildContext context, int index) {
                      String label = results[index]['label'];
                      String description = getDescriptionForLabel(label);
                      return Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Container(
                          margin: const EdgeInsets.only(left: 50, top: 20, right: 20, bottom: 20),
                          child: Text(
                            (results[index]['confidence']) >= 0.80
                                ? description
                                : "Error",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Okay Button
                /*        Container(
                  margin: EdgeInsets.all(20),
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6F1D1B),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextButton(
                    child: const Text(
                      'Okay',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Scan()),
                      );
                    },
                  ),
                ),

         */
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getDescriptionForLabel(String label) {
    for (int index = 0; index < labels.length; index++) {
      if (labels[index] == label) {
        if (index < models.length) {
          return "Title: ${models[index].title}\nDescription: ${models[index].description} ";
        } else {
          return "Description not found";
        }
      }
    }
    return "Description not found";
  }
}