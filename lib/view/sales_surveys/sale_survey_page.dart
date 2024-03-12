import 'package:flutter/material.dart';
import 'package:sbc_app/view/sales_surveys/widget/add_survey.dart';

import '../home_page.dart';
import '../navigation_bar/navigation_bar.dart';

class SaleSurveyPage extends StatefulWidget {
  const SaleSurveyPage ({super.key});

  @override
  _SaleSurveyPageState createState() => _SaleSurveyPageState();
}

class _SaleSurveyPageState extends State<SaleSurveyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottinNavigationBar(),));
            },
            icon: Icon(Icons.arrow_back),color: Colors.black),
        title: Text(
          "Sale Survey",style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/OT.png'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade900,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddSuveryPage(),));
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
