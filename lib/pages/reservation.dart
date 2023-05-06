import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Reservation extends StatefulWidget {
  final DateTime initialDate;

  const Reservation({Key? key, required this.initialDate}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  DateTime? _pickedDate;

  @override
  void initState() {
    super.initState();
    _pickedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Museum Tour Reservation",
          style: TextStyle(
              color: Color(0xFF6F1D1B),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF6F1D1B),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            Text(
              "**Please write all the information needed.",
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: Color(0xFF6F1D1B),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 40.0),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Date',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              height: 50,
              child: TextField(
                controller: _date,
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: 'Select date',
                  hintStyle: TextStyle(color: Colors.black38),
                ),
                onTap: () async{
                  DateTime initialDate = DateTime.now();
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (_pickedDate != null) {
                    _date.text = DateFormat('MM-dd-yyyy').format(_pickedDate!);
                  }
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Time',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              height: 50,
              child: TextField(
                controller: _time,
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                  prefixIcon: Icon(Icons.access_time),
                  hintText: 'Select time',
                  hintStyle: TextStyle(color: Colors.black38),
                ),
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    _time.text = pickedTime.format(context);
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Contact number',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
              ),
              height: 50,
              child: const TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    hintText: 'Enter your contact number',
                    hintStyle: TextStyle(color: Colors.black38)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Purpose',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
              ),
              height: 50,
              child: const TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    hintText: 'Enter your purpose',
                    hintStyle: TextStyle(color: Colors.black38)),
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'REMINDERS!!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: '1. ',
                    ),
                    TextSpan(
                      text: 'Cancelation/Changing Schedule Tour',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: ' must be made before the Day of Tour.',),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: '2. '),
                    TextSpan(
                      text: 'Wear Proper Attire! \n',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: 'Prohibited: sandos, sandals, sleeveless clothes, short skirts, jersey shorts.',),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30.0),
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
                      'Submit',
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
      );
  }
}
