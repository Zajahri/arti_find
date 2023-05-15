import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Feedback Form',
          style: TextStyle(
            color: Color(0xFF6F1D1B),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF6F1D1B),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Table(
          children: [
            TableRow(
              children: [
                const TableCell(
                  child: Text(
                    'Question 1',
                    style: TextStyle(
                      color: Color(0xFF6F1D1B),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                TableCell(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Checkbox(
                          value: _isChecked1,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked1 = value ?? false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Checkbox(
                          value: _isChecked2,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked2 = value ?? false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Checkbox(
                          value: _isChecked3,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked3 = value ?? false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Checkbox(
                          value: _isChecked4,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked4 = value ?? false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
