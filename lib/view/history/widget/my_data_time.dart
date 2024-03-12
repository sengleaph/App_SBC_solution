import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:intl/intl.dart';

class MyDataTime extends StatefulWidget {
  const MyDataTime ({super.key});

  @override
  _MyDataTimeState createState() => _MyDataTimeState();
}

class _MyDataTimeState extends State<MyDataTime> {

  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          HorizontalWeekCalendar(
            weekStartFrom: WeekStartFrom.Monday,
            activeBackgroundColor: Colors.purple,
            activeTextColor: Colors.white,
            inactiveBackgroundColor: Colors.purple.withOpacity(.3),
            inactiveTextColor: Colors.white,
            disabledTextColor: Colors.grey,
            disabledBackgroundColor: Colors.grey.withOpacity(.3),
            activeNavigatorColor: Colors.purple,
            inactiveNavigatorColor: Colors.grey,
            monthColor: Colors.purple,
            onDateChange: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Selected Date",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  DateFormat('dd MMM yyyy').format(selectedDate),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
