import 'package:flutter/material.dart';
import 'package:sbc_app/model/customer_model/costumer_model.dart';
import 'package:sbc_app/model/customer_model/post_customer_request.dart';
import 'package:sbc_app/model/sale_survey_no_mvvm/sale_survey_model.dart';
import 'package:sbc_app/view/Costumer/no_mvvm/Custumer_page.dart';
import 'package:sbc_app/view/Costumer/no_mvvm/widget/update_no_mvvm.dart';
import 'package:http/http.dart' as http;
import 'package:sbc_app/view/sales_surveys/no_mvvm/widget/update_sales_no_mvvm.dart';

import '../../../../util/auth/utils.dart';

class SaleDetail extends StatefulWidget {
  SaleModel saleModel;
  final void Function() onUpdate;

  SaleDetail({required this.saleModel, required this.onUpdate});

  @override
  State<SaleDetail> createState() => _SaleDetailState();
}

class _SaleDetailState extends State<SaleDetail> {
  bool isDataUpdated = false;

  //===================================================================================================================================
  //deleted api
  //===================================================================================================================================
  Future<void> deleteData(String id) async {
    var id = widget.saleModel.id;

    var headers = {
      'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
      'Cookie': 'bpas_cart_id=ed3ae164d4f4b1e98c577e3418f0335b'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://178.128.24.212:9876/mv_research/api/v1/sales_order/add_sale_outdoor/$id?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo'));
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Utils.flushBarSuccessMessage(
            'Customer are Deleted Successfully', context);
      } else {
        print(response.reasonPhrase);
        Utils.flushBarErrorMessage('Fail to Delete Data', context);
      }
    } catch (e) {
      print('Error deleting item: $e');
      Utils.flushBarErrorMessage('Fail to Delete Data', context);
    }
  }
  //===================================================================================================================================

  Future<void> _refreshData() async {
    // Simulate data refresh
    await Future.delayed(Duration(seconds: 1));

    // Call setState to update the UI
    setState(() {
      // Update your data here if necessary
      isDataUpdated = true;
    });
  }

  //===================================================================================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustumerPage(),
                  ));
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: Text(
          "Customer Detail",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.saleModel.id;
              widget.saleModel.customer;
              widget.saleModel.image;
              widget.saleModel.images;
              widget.saleModel.date;
              widget.saleModel.salemanBy;
              widget.saleModel.referenceNo;
              widget.saleModel.biller;
              widget.saleModel.billerId;
              widget.saleModel.createdBy;
              widget.saleModel.currencyRateKh;
              widget.saleModel.customerId;
              widget.saleModel.deliveryBy;
              widget.saleModel.deliveryDate;
              widget.saleModel.deliveryStatus;
              widget.saleModel.images;
              widget.saleModel.locationId;
              widget.saleModel.moduleType;
              widget.saleModel.note;
              widget.saleModel.orderDiscount;
              widget.saleModel.orderDiscountId;
              widget.saleModel.orderStatus;
              widget.saleModel.orderTax;
              widget.saleModel.orderTaxId;
              widget.saleModel.projectId;
              widget.saleModel.rounding;
              widget.saleModel.saleStatus;
              widget.saleModel.total;
              widget.saleModel.totalItems;
              widget.saleModel.totalTax;
              widget.saleModel.warehouseId;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateSalesSurveyNoMVVM(
                      saleModel: widget.saleModel,
                    ),
                  ));
            },
            icon: Icon(Icons.edit, color: Colors.green.shade900),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirm Delete"),
                    content: Text("Are you sure you want to delete this item?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustumerPage(),
                              )); // Close the alert dialog
                          await deleteData(
                              '${widget.saleModel.id}'); // Call delete data function
                        },
                        child: Text("Delete"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the alert dialog
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.delete,
              color: Colors.green.shade900,
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
                  child: Image.network(
                      'https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133351928-stock-illustration-default-placeholder-man-and-woman.jpg',
                      width: MediaQuery.of(context).size.width),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.id}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.id}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Biller:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.biller}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Biller:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.biller}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Custumer:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.customer}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Custumer ID:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.customerId}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.date}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Delivery By:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.deliveryBy}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Deliverty Date:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.deliveryDate}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Delivery Status:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.deliveryStatus}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Location ID:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.locationId}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Module Type:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.moduleType}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Note:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.note}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order Discount:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.orderDiscount}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order Discount ID:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.orderDiscountId}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order Status:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.orderStatus}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order Tax:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.orderTax}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order Tax ID:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.orderTaxId}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Project ID:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.projectId}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rounding:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.rounding}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sale Status: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.saleStatus}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.total}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Item:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.totalItems}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Tax:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.totalTax}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('WarehouseId:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.saleModel.warehouseId}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
