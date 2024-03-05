import 'package:flutter/material.dart';

import 'table_page.dart';

class MyTablePage extends StatelessWidget {
  MyTablePage ({super.key});

  DataTableSource _data = TablePage();

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(

      source: _data,
      columns: [
        DataColumn(
            label: Text(
              'Campany',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        DataColumn(
            label: Text('Name',
                style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Phone Number',
                style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('View',
                style: TextStyle(fontWeight: FontWeight.bold))
        ),

      ],
      columnSpacing: 60,
      horizontalMargin: MediaQuery.of(context).size.width * 0.2,
    );
  }
}