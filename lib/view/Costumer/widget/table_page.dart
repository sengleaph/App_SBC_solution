import 'dart:math';

import 'package:flutter/material.dart';

class TablePage extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
            "phone": Random().nextInt(100000),
            "view": Icons.remove_red_eye_rounded,
          });

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(_data[index]['id'].toString()), onTap: () {}),
        DataCell(Text(_data[index]['title'])),
        DataCell(Text(_data[index]['phone'].toString())),
        DataCell(Icon(_data[index]['view']), onTap: () {}),
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
