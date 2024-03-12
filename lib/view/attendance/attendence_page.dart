import 'package:flutter/material.dart';
import 'package:sbc_app/view/attendance/witget/clock_page.dart';
import 'package:sbc_app/view/home_page.dart';

import '../navigation_bar/navigation_bar.dart';

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
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottinNavigationBar(),));
            },
            icon: Icon(Icons.arrow_back,color: Colors.black)),
        title: Text(
          "Attendence", style: TextStyle(color: Colors.black),
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
