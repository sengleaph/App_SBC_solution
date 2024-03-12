import 'dart:math';

import 'package:flutter/material.dart';

class TebleTimeLeave extends DataTableSource {

  DateTime _currentTime = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_currentTime),
    );
    if (pickedTime != null) {
      _currentTime = DateTime(
        _currentTime.year,
        _currentTime.month,
        _currentTime.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    }
  }

  final List<Map<String, dynamic>> _data = List.generate(
    200,
        (index) => {
      "id": index,
      "date": '${DateTime.now().year}:${DateTime.now().month}:${DateTime.now().day}-${DateTime.now().year}:${DateTime.now().month}:${DateTime.now().day}',
      "time leave": Random().nextInt(24), // Generate a random hour value (0-23)
      "type": ['Type A', 'Type B', 'Type C'].elementAt(Random().nextInt(3)), // Choose a random type from the list
      "time Shift": ['full', 'part-time', 'flexible'].elementAt(Random().nextInt(3)), // Choose a random shift type from the list
      "reason": "Reason ${index + 1}", // Generate a reason based on index
      "status": ['approved', 'pending', 'rejected'].elementAt(Random().nextInt(3)), // Choose a random status from the list
    },
  );


  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(_data[index]['id'].toString()), onTap: () {}),
        DataCell(Text(_data[index]['date'])),
        DataCell(Text(_data[index]['time leave'].toString())),
        DataCell(Text(_data[index]['type'].toString())),
        DataCell(Text(_data[index]['time Shift'].toString())),
        DataCell(Text(_data[index]['reason'].toString())),
        DataCell(Text(_data[index]['status'].toString())),
      ],
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}