import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  double _rating = 0;
  List<String> ratingNames = [
    'Very Dissatisfied',
    'Dissatisfied',
    'Neutral',
    'Satisfied',
    'Very Satisfied'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Feedback",
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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "How would you rate your experience at Museum of Bayambang?",
                  style: TextStyle(
                    color: Color(0xFF6F1D1B),
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                RatingBar.builder(
                  initialRating: _rating,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return const Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return const Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return const Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return const Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return const Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                      default:
                        return const Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                    }
                  },
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                    debugPrint('$rating');
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Rating: ${ratingNames[(_rating - 1).toInt().clamp(0, ratingNames.length - 1)]}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Do you have any suggestions to improve our Museum?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,)
                    ],
                  ),
                  height: 250,
                  child: const TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: -110,left: 14, right: 14),
                        hintText: 'Please fill in your answer',
                        hintStyle: TextStyle(color: Colors.black38, fontFamily: 'Montserrat', fontSize: 16,)),
                  ),
                ),
                const SizedBox(height: 80),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6F1D1B),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2))
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: const Center(
                        child: Text(
                          'Send feedback',
                          style: TextStyle(
                              color: Color(0xFFE9DBC7),
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
