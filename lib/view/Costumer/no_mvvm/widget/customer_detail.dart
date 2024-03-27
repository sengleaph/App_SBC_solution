import 'package:flutter/material.dart';
import 'package:sbc_app/model/customer_model/costumer_model.dart';
import 'package:sbc_app/model/customer_model/post_customer_request.dart';
import 'package:sbc_app/view/Costumer/no_mvvm/Custumer_page.dart';
import 'package:sbc_app/view/Costumer/no_mvvm/widget/update_no_mvvm.dart';
import 'package:http/http.dart' as http;

import '../../../../util/auth/utils.dart';

class CustomerDetail extends StatefulWidget {
  CustomerModel customerModel;
  final void Function() onUpdate;

  CustomerDetail({required this.customerModel, required this.onUpdate});

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  bool isDataUpdated = false;


  //===================================================================================================================================
  //deleted api
  //===================================================================================================================================
  Future<void> deleteData(String id) async {

    var id = widget.customerModel
        .id;

    var headers = {
      'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
      'Cookie': 'bpas_cart_id=ed3ae164d4f4b1e98c577e3418f0335b'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://178.128.24.212:9876/mv_research/api/v1/customers/delete/$id?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo'));
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Utils.flushBarSuccessMessage('Customer are Deleted Successfully', context);
       
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
              widget.customerModel.id;
              widget.customerModel.gender;
              widget.customerModel.name;
              widget.customerModel.email;
              widget.customerModel.company;
              widget.customerModel.phone;
              widget.customerModel.address;
              widget.customerModel.code;
              widget.customerModel.customerGroup;
              widget.customerModel.price;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoMvvmUpdateCustomer(
                      customerModel: widget.customerModel, onUpdate: (CustomerModel updatedCustomerModel) {  },
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CustumerPage(),)); // Close the alert dialog
                          await deleteData('${widget.customerModel.id}'); // Call delete data function
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
                            Text('${widget.customerModel.id}',
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
                            Text('Company:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.customerModel.company}',
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
                            Text('Name:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.customerModel.name}',
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
                            Text('Email:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.customerModel.email}',
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
                            Text('Gender:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.customerModel.gender}',
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
                            Text('Phone:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.customerModel.phone}',
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
                            Text('Code:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.customerModel.code}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Price:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.customerModel.price}',
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
                            Text('Address:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.customerModel.address}',
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
                            Text('Customer Group:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${widget.customerModel.customerGroup.toString()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
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
