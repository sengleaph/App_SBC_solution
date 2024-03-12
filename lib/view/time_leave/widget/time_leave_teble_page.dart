import 'package:flutter/material.dart';
import 'package:sbc_app/view/time_leave/widget/teble_time_leave.dart';

class TimeLeaveTeblePage extends StatelessWidget {
  // const TimeLeaveTeblePage ({super.key});

  TebleTimeLeave _data = TebleTimeLeave();

  Widget build(BuildContext context) {
    return PaginatedDataTable(

      source: _data,
      columns: [
        DataColumn(
            label: Text(
              'ID',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        DataColumn(
            label: Text('DATE',
                style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('TIME LEAVE',
                style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('TYPE',
                style: TextStyle(fontWeight: FontWeight.bold))
        ),
        DataColumn(
            label: Text('TIME SHIRF',
                style: TextStyle(fontWeight: FontWeight.bold))
        ),
        DataColumn(
            label: Text('REASON',
                style: TextStyle(fontWeight: FontWeight.bold))
        ),
        DataColumn(
            label: Text('STATUS',
                style: TextStyle(fontWeight: FontWeight.bold))
        ),

      ],
      columnSpacing: 60,
      horizontalMargin: MediaQuery.of(context).size.width * 0.2,
    );
  }
}
