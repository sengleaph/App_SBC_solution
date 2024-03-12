import 'package:flutter/material.dart';

class TypeLeavePage extends StatefulWidget {
  @override
  _TypeLeavePageState createState() => _TypeLeavePageState();
}

class _TypeLeavePageState extends State<TypeLeavePage> {
  String _selectedTimeShift = 'Delivery Child'; // Default selected gender

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Time Shift'),
                        ),
                        Container(

                          // decoration: BoxDecoration(
                          //   border: Border.all(strokeAlign: 1),
                          // ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: DropdownButton<String>(
                              value: _selectedTimeShift,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedTimeShift = newValue!;
                                });
                              },
                              items: <String>['Delivery Child', 'Maternity Leave', 'Sick Leave']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}