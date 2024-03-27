import 'package:flutter/material.dart';

class SalesManPage extends StatefulWidget {
  @override
  _SalesManPageState createState() => _SalesManPageState();
}

class _SalesManPageState extends State<SalesManPage> {
  String _selectedSalesman = 'name1'; // Default selected gender

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Salesman'),
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(strokeAlign: 1),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: DropdownButton<String>(
                        value: _selectedSalesman,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedSalesman = newValue!;
                          });
                        },
                        items: <String>['hhhhhaahahahha', 'name1']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        )
      ],
    );
  }
}