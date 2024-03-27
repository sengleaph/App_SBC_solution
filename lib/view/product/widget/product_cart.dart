import 'package:flutter/material.dart';
import 'package:sbc_app/model/product_model/product_model.dart';

class ProductCart extends StatelessWidget {
  ProductData? productData;


  ProductCart({this.productData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.19,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 150,
              height: double.maxFinite * .9,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image.network(
                  '${productData!.image}',
                  fit: BoxFit.cover,

                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${productData!.name}",
                      maxLines: 2,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Column(
                     children: [
                       Text('Code: ${productData!.code}'),
                       SizedBox(height: 3,),
                       Text('Quantity: ${productData!.quantity}'),
                       SizedBox(height: 3,),
                       Text('Price: ${productData!.price}'),
                       SizedBox(height: 3,),
                       Text('Type: ${productData!.type}'),
                     ],
                    ),
                    // const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
