import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../sale_survey_page.dart';
import 'date_picker.dart';

class NoMVVMAddSale extends StatefulWidget {
  @override
  _NoMVVMAddSaleState createState() => _NoMVVMAddSaleState();
}

class _NoMVVMAddSaleState extends State<NoMVVMAddSale> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController customerIdController = TextEditingController();
  final TextEditingController billerIdController = TextEditingController();
  final TextEditingController salesmanIdController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController staffNoteController = TextEditingController();
  final TextEditingController productIdController = TextEditingController();
  final TextEditingController productTypeController = TextEditingController();
  final TextEditingController productCodeController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productUnitController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController realUnitPriceController = TextEditingController();
  final TextEditingController productOptionController = TextEditingController();
  final TextEditingController serialController = TextEditingController();
  final TextEditingController maxSerialController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  Future<void> postData() async {
    var headers = {
      'Content-Type': 'application/json',
      'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
      'Cookie': 'bpas_cart_id=ed3ae164d4f4b1e98c577e3418f0335b; bpas_token_cookie=58a4266dd461cf60f892d34fc455b2ca; sess=h1ita10164r8vns2n83s7qmcjasganob'
    };

    var url = 'http://178.128.24.212:9876/mv_research/api/v1/sales_order/add_sale_outdoor?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo';

    var requestBody = {
      "data": {
        "date": dateController.text,
        "customer_id": customerIdController.text,
        "biller_id": billerIdController.text,
        "salesman_id": salesmanIdController.text,
        "created_by": createdByController.text,
        "note": noteController.text,
        "staff_note": staffNoteController.text,
      },
      "products": {
        "product_id": productIdController.text,
        "product_type": productTypeController.text,
        "product_code": productCodeController.text,
        "product_name": productNameController.text,
        "product_unit": productUnitController.text,
        "quantity": int.parse(quantityController.text),
        "unit_price": double.parse(unitPriceController.text),
        "real_unit_price": double.parse(realUnitPriceController.text),
        "product_option": productOptionController.text,
        "serial": serialController.text,
        "max_serial": maxSerialController.text,
      },
      "customer": customerController.text,
      "images": [
        imageController.text,
      ]
    };

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        // If the request is successful, navigate to SaleSurveyPage
        print(' ${response.statusCode}');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SaleSurveyPage()),
        );
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }



  String? _selectedCreator;
  // DateTime? _selectedDate;
  // Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null && picked != _selectedDate) {
  //     setState(() {
  //       _selectedDate = picked;
  //       controller.text = picked.toString(); // You can format the date here
  //     });
  //   }
  // }

  Future<void> _getImage(
      BuildContext context, TextEditingController controller) async {
    // Your image picker logic here
  }

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
                    builder: (context) => SaleSurveyPage(),
                  ));
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: Text(
          "Add Survey",
          style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DatePickerPage(),
            SizedBox(height: 15,),
            TextField(
              controller: customerIdController,
              decoration: InputDecoration(
                labelText: 'Customer ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: billerIdController,
              decoration: InputDecoration(
                labelText: 'Biller ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: salesmanIdController,
              decoration: InputDecoration(
                labelText: 'Salesman ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DropdownButtonFormField<String>(
              value: _selectedCreator,
              items: ['Admin', 'General', 'Other'].map((create) {
                return DropdownMenuItem<String>(
                  value: create,
                  child: Text(create),
                );
              }).toList(),
              decoration: InputDecoration(
                hintText: 'Select Created By',
                labelText: 'Created By',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedCreator = value;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: 'Note',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
                controller: staffNoteController,
                decoration: InputDecoration(
                  labelText: 'Staff Note',
                  border: OutlineInputBorder(),
                )),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: productIdController,
              decoration: InputDecoration(
                labelText: 'Product ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: productTypeController,
              decoration: InputDecoration(
                labelText: 'Product Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: productCodeController,
              decoration: InputDecoration(
                labelText: 'Product Code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: productUnitController,
              decoration: InputDecoration(
                labelText: 'Product Unit',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: unitPriceController,
              decoration: InputDecoration(
                labelText: 'Unit Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: realUnitPriceController,
              decoration: InputDecoration(
                labelText: 'Real Unit Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: productOptionController,
              decoration: InputDecoration(
                labelText: 'Product Option',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: customerController,
              decoration: InputDecoration(
                labelText: 'Customer',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(
                labelText: 'Image',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                postData();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
