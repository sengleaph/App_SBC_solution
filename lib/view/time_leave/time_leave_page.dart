import 'package:flutter/material.dart';
import 'package:sbc_app/view/home_page.dart';
import 'package:sbc_app/view/time_leave/widget/request_time_leave.dart';

import '../navigation_bar/navigation_bar.dart';
import 'widget/time_leave_teble_page.dart';

class TimeLeavePage extends StatelessWidget {
  const TimeLeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottinNavigationBar(),));
            },
            icon: Icon(Icons.arrow_back),color: Colors.black),
        title: Text(
          "Leave", style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: TimeLeaveTeblePage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade900,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RequestTimeLeavePage(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
