import 'package:flutter/material.dart';
import 'package:sbc_app/view/report/widget/add_report.dart';
import 'package:sbc_app/view/report/widget/report_cart.dart';
import 'package:sbc_app/view/report/widget/report_detail.dart';

import '../home_page.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

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
                    builder: (context) => HomePage(),
                  ));
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: Text(
          "Report",
          style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
        itemBuilder: (context, index) => GestureDetector(
          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ReportDetail(),)),
        child: ReportCart(),
        ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green.shade900,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddReport(),
                ));
          },
          child: Icon(Icons.add),
        )
    );
  }
}
