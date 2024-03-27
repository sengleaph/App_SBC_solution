import 'package:flutter/material.dart';
import 'package:sbc_app/model/customer_model/post_customer_request.dart';
import '../../../../model/customer_model/costumer_model.dart';

class DataSource extends DataTableSource {
  List<CustomerModel> data;
  Function(CustomerModel) onTap;
  bool isLoading = false;


  DataSource({required this.data, required this.onTap, this.isLoading = false});

  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    if (index >= data.length) {
      return null;
    }
    final item = data[index];

    return DataRow(
      cells: [
        DataCell(Text(item!.company!)),
        DataCell(Text(item!.name!)),
        DataCell(Text(item!.phone.toString())),
        DataCell(GestureDetector(
          child: Icon(Icons.remove_red_eye),
          onTap: () {
            onTap(item);
          },
        )),
      ],
    );
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
