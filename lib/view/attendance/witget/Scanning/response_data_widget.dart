import 'package:flutter/material.dart';

import '../../../../model/auth_model/UserModel.dart';

class ResponseDataWidget extends StatelessWidget {
  ResponseDataWidget({super.key});
  DateTime _currentTime = DateTime.now();
  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.fromDateTime(_currentTime),
  //   );
  //   if (pickedTime != null) {
  //     setState(() {
  //       _currentTime = DateTime(
  //         _currentTime.year,
  //         _currentTime.month,
  //         _currentTime.day,
  //         pickedTime.hour,
  //         pickedTime.minute,
  //       );
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Employee${UserModel.username}',
                      style: TextStyle(fontSize: 18)),
                  Container(
                    child: SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${_currentTime.hour}:${_currentTime.minute}:${_currentTime.second}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.access_time, size: 10),
                                Text(
                                  'Clock In',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      width: 110,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
