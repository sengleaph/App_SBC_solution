import 'package:flutter/material.dart';
import 'package:sbc_app/model/customer_model/costumer_model.dart';
import 'package:sbc_app/model/customer_model/post_customer_request.dart';
import 'package:sbc_app/view/Costumer/no_mvvm/Custumer_page.dart';
import 'package:sbc_app/view/Costumer/no_mvvm/widget/update_no_mvvm.dart';

class CustomerDetail extends StatelessWidget {
  CustomerModel customerModel;

  CustomerDetail({Key? key, required this.customerModel}) : super(key: key);

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NoMvvmUpdateCustomer(customerModelPost: CustomerModelPost()),
                  ));
            },
            icon: Icon(Icons.edit, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: Colors.grey,
            ),
          )
        ],
        // centerTitle: true,
      ),
      body: Container(
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
                          Text('${customerModel.id}',
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
                          Text('${customerModel.company}',
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
                          Text('${customerModel.name}',
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
                          Text('${customerModel.email}',
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
                          Text('${customerModel.gender}',
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
                          Text('${customerModel.phone}',
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
                          Text('Price:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          Text('${customerModel.price}',
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
                          Text('${customerModel.address}',
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
                          Text('${customerModel.customerGroup}',
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
    );
  }
}
