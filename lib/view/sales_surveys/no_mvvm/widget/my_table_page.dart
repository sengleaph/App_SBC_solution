import 'package:flutter/material.dart';
import '../../../../model/sale_survey_no_mvvm/sale_survey_model.dart';


class DataSource extends DataTableSource{
  List<SaleModel> data;
  final Function(SaleModel) onTap;



  DataSource({required this.data, required this.onTap});

  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    if(index >= data.length){
      return null;
    }
    final item = data[index];

      return DataRow(cells: [
        DataCell(Text(item.date!.toString())),
        DataCell(Text(item.referenceNo!)),
        DataCell(Text(item.salemanBy!)),
        DataCell(Text(item.customer!)),
        DataCell(GestureDetector(child: Icon(Icons.remove_red_eye),
          onTap: () {
            // Call the onTap callback function
            onTap(item);
          },)),
      ]);

  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}