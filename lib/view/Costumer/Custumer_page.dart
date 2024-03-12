import 'package:flutter/material.dart';
import 'package:sbc_app/view/Costumer/widget/add_custumer.dart';
import 'package:sbc_app/view/Costumer/widget/table_page.dart';
import 'package:sbc_app/view/home_page.dart';

import '../navigation_bar/navigation_bar.dart';
import 'widget/MyTablePage.dart';

class CustumerPage extends StatefulWidget {
  const CustumerPage({super.key});

  @override
  _CustumerPageState createState() => _CustumerPageState();
}

class _CustumerPageState extends State<CustumerPage> {
  String? title;
  DataTableSource _data = TablePage();
  // List<Map<String, dynamic>> _allUsers = [
  //   {"id": 1, "campany": "Sbc", "name": "leaph", "phonenumber": 29},
  //   {"id": 2, "campany": "kbbank", "name": "de", "phonenumber": 17},
  //   {"id": 3, "campany": "Sbc", "name": "le", "phonenumber": 68},
  //   {"id": 5, "campany": "kbbank", "name": "lee", "phonenumber": 45},
  //   {"id": 4, "campany": "Sbc", "name": "lea", "phonenumber": 23},
  //   {"id": 8, "campany": "kbbank fkajsdk", "name": "leap", "phonenumber": 24},
  //   {"id": 7, "campany": "Sbc", "name": "leeh", "phonenumber": 173502516},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottinNavigationBar(),));
            },
            icon: Icon(Icons.arrow_back,color: Colors.black)),
        title: Text(
          "Customer", style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 50,
                      // width: 50,
                      // decoration: BoxDecoration(
                      //   color: Colors.grey,
                      //   borderRadius: BorderRadius.circular(14),
                      // ),
                      child: const Center(
                        child: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTablePage(),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade900,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCustumer(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
