
import 'package:flutter/material.dart';

class SalaryFormDetailsPage extends StatelessWidget {
  final double salary;

  SalaryFormDetailsPage({required this.salary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),color: Colors.black),
        title: Text(
          "Salary Detail",
          style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Your monthly salary is \$${salary.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}