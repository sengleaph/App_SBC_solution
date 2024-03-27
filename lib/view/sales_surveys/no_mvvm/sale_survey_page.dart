import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sbc_app/view/sales_surveys/no_mvvm/widget/add_sales_no_mvvm.dart';
import 'package:sbc_app/view/sales_surveys/no_mvvm/widget/sale_detail.dart';

import '../../../model/sale_survey_no_mvvm/sale_survey_model.dart';
import '../../home_page.dart';
import '../../navigation_bar/navigation_bar.dart';
import 'widget/add_survey.dart';
import 'package:http/http.dart' as http;

import 'widget/my_table_page.dart';

class SaleSurveyPage extends StatefulWidget {
  const SaleSurveyPage({super.key});

  @override
  _SaleSurveyPageState createState() => _SaleSurveyPageState();
}

class _SaleSurveyPageState extends State<SaleSurveyPage> {
  List<SaleModel> _saler = [];
  bool _isLoading = false;
  int _currentPage = 1;
  int _pageSize = 10;

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
            'http://178.128.24.212:9876/mv_research/api/v1/sales_order/add_sale_outdoor?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo'),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> dataList = jsonData['data'];
        final List<SaleModel> saler =
            dataList.map((item) => SaleModel.fromJson(item)).toList();

        setState(() {
          _saler = saler;
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottinNavigationBar(),
                  ));
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black),
        title: Text(
          "Sale Survey",
          style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : SizedBox(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Provide a finite width
                  child: PaginatedDataTable(
                    // header: Text('Customer'),
                    rowsPerPage: _pageSize,
                    availableRowsPerPage: [10, 25, 50, 100],
                    onRowsPerPageChanged: (value) {
                      setState(() {
                        _pageSize = value!;
                      });
                    },
                    columns: [
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Reference')),
                      DataColumn(label: Text('SalesMan')),
                      DataColumn(label: Text('Customer')),
                      DataColumn(label: Text('Action')),
                    ],
                    source: DataSource(
                        data: _saler,
                        onTap: (SaleModel) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SaleDetail(),
                              ));
                        }),
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade900,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoMVVMAddSale(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
