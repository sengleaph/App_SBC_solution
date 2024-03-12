
import 'package:flutter/material.dart';
import 'package:sbc_app/view/salary/widget/SalaryFormDetail.dart';

import '../home_page.dart';
import '../navigation_bar/navigation_bar.dart';

class SalaryForm extends StatefulWidget {
  @override
  _SalaryFormState createState() => _SalaryFormState();
}

class _SalaryFormState extends State<SalaryForm> {
  TextEditingController _salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottinNavigationBar(),));
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: Text(
          "Salary", style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your monthly salary:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _salaryController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'e.g. 5000',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Process the salary entered
                    // For example, you can navigate to another page to display the details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SalaryFormDetailsPage(
                          salary: double.parse(_salaryController.text),
                        ),
                      ),
                    );
                  },
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _salaryController.dispose();
    super.dispose();
  }
}