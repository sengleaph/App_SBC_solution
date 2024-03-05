import 'package:flutter/material.dart';
import 'package:sbc_app/view/attendance/witget/clock_page.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage ({super.key});

  @override
  _AttendencePageState createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Attendence",
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ClockPage(),
            ),

          ],
        ),
      )
    );
  }
}
