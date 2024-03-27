import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sbc_app/view/Costumer/no_mvvm/widget/customer_detail.dart';

import '../../../model/customer_model/costumer_model.dart';
import '../../home_page.dart';
import 'widget/add_customer_no_mvvm.dart';
import 'widget/add_custumer.dart';
import 'widget/table_page.dart';

class CustumerPage extends StatefulWidget {
  CustumerPage({super.key});

  @override
  _CustumerPageState createState() => _CustumerPageState();
}

class _CustumerPageState extends State<CustumerPage> {
  List<CustomerModel> _customers = [];
  bool _isLoading = false;
  int _currentPage = 5;
  int _pageSize = 10
  ;
  // List<> _data = [];
  // bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await http.get(
        Uri.parse(
            'http://178.128.24.212:9876/mv_research/api/v1/customers?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo'),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> dataList = jsonData['data'];
        final List<CustomerModel> customers =
            dataList.map((item) => CustomerModel.fromJson(item)).toList();

        setState(() {
          _customers = customers;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to fetch data: $e');
    }
  }

  void _loadMoreData() {
    if (!_isLoading) {
      setState(() {
        _currentPage++;
      });
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              icon: Icon(Icons.arrow_back, color: Colors.black)),
          title: Text(
            "Customer",
            style: TextStyle(color: Colors.black),
          ),
          // centerTitle: true,
        ),
        body: SingleChildScrollView(
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
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  :  PaginatedDataTable(
                        // header: Text('Customer'),
                        rowsPerPage: _pageSize,
                        availableRowsPerPage: [5, 10, 20, 30, 40,  50, 100],
                        onRowsPerPageChanged: (value) {
                          setState(() {
                            _pageSize = value!;
                          });
                          fetchData();
                        },
                        columns: [
                          DataColumn(label: Text('Company')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Phone')),
                          DataColumn(label: InkWell(child: Icon(Icons.remove_red_eye),)),


                        ],
                        onPageChanged: (value) => _currentPage + 1,
                        source: DataSource(data: _customers, onTap: (CustomerModel){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerDetail(customerModel: CustomerModel,)));
                        }),
                        header: _isLoading || _customers.isEmpty
                            ? null
                            : SizedBox(height: 10),
                        // Enable loading more data when reaching the end of the data
                        // onPageChanged: (pageIndex) {
                        //   setState(() {
                        //     _currentPage = pageIndex + 1;
                        //   });
                        //   fetchData();
                        // },
                      ),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green.shade900,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoMvvmAddCustomer(),
                ));
          },
          child: Icon(Icons.add),
        ));
  }
}
