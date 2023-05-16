import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxTable extends StatefulWidget {
  @override
  _CheckBoxTableState createState() => _CheckBoxTableState();
}

class _CheckBoxTableState extends State<CheckBoxTable> {
  List<bool> isCheckedList = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
        4: FlexColumnWidth(),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Checkbox(
                value: isCheckedList[0],
                onChanged: (value) {
                  setState(() {
                    isCheckedList[0] = value!;
                  });
                },
              ),
            ),
            TableCell(
              child: Checkbox(
                value: isCheckedList[1],
                onChanged: (value) {
                  setState(() {
                    isCheckedList[1] = value!;
                  });
                },
              ),
            ),
            TableCell(
              child: Checkbox(
                value: isCheckedList[2],
                onChanged: (value) {
                  setState(() {
                    isCheckedList[2] = value!;
                  });
                },
              ),
            ),
            TableCell(
              child: Checkbox(
                value: isCheckedList[3],
                onChanged: (value) {
                  setState(() {
                    isCheckedList[3] = value!;
                  });
                },
              ),
            ),
            TableCell(
              child: Checkbox(
                value: isCheckedList[4],
                onChanged: (value) {
                  setState(() {
                    isCheckedList[4] = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:
        const Text(
          "Feedback Form",
          style: TextStyle(
            color: Color(0xFF6F1D1B),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6F1D1B),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
                  'Please take a moment to complete the following survey '
                  'about your visit and experience at Museum of Bayambang. '
                  'Your feedback is important to us as we continue to make improvements '
                  'to better serve the public',
              style: TextStyle(
                color: Color(0xFF6F1D1B),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            CheckBoxTable(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Process the feedback
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}