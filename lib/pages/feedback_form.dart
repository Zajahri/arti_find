import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  List<bool?> satisfiedList = List<bool?>.filled(5, null);

  Widget buildRatingQuestion(int index, String question) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio<bool?>(
                value: true,
                groupValue: satisfiedList[index],
                onChanged: (value) {
                  setState(() {
                    satisfiedList[index] = value;
                  });
                },
              ),
              const Text('Satisfied'),
              Radio<bool?>(
                value: false,
                groupValue: satisfiedList[index],
                onChanged: (value) {
                  setState(() {
                    satisfiedList[index] = value;
                  });
                },
              ),
              const Text('Not Satisfied'),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Feedback Form",
          style: TextStyle(
            color: Color(0xFF6F1D1B),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6F1D1B)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please take a moment to rate your satisfaction for the following questions:',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            buildRatingQuestion(0, 'Question 1'),
            buildRatingQuestion(1, 'Question 2'),
            buildRatingQuestion(2, 'Question 3'),
            buildRatingQuestion(3, 'Question 4'),
            buildRatingQuestion(4, 'Question 5'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Handle form submission
          // Access the selected values from 'satisfiedList'
          // and perform the necessary actions
        },
        label: const Text('Submit'),
        icon: const Icon(Icons.send),
      ),
    );
  }
}
