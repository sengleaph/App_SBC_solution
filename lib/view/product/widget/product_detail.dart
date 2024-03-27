import 'package:flutter/material.dart';
import 'package:sbc_app/model/product_model/product_model.dart';
import 'package:sbc_app/view/home_page.dart';

import '../../../viewmodel/product_viewmodel/product_viewmodel.dart';

class ProductDetail extends StatelessWidget {
  ProductData? productData;


  ProductDetail({required this.productData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, HomePage());
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Image.network(
                      '${productData!.image}',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    child: Image.network(
                        '${productData!.barcode}'),
                  ),
                  Container(
                    height: 150,
                    width:  170,
                    child: Image.network(
                      '${productData!.qrcode!.codeUnits}',
                      // fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${productData!.name}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${productData!.code}',
                    style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Type: ${productData!.type}'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Brand: ${productData!.brand}'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Category: ${productData!.category}'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Serial: ${productData!.serialNo}'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Max Serial: ${productData!.maxSerial}'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Unit: ${productData!.unit}'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Price: ${productData!.price}'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Quantity: ${productData!.quantity}'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Tax Rate: ${productData!.taxRate}'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Tax Method: ${productData!.taxMethod}'),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
