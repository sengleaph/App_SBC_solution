
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Custumer_page.dart';

class NoMvvmAddCustomer extends StatefulWidget {
  @override
  _NoMvvmAddCustomerState createState() => _NoMvvmAddCustomerState();
}

class _NoMvvmAddCustomerState extends State<NoMvvmAddCustomer> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> postData() async {
    var headers = {
      'Content-Type': 'application/json',
      'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
      'Cookie': 'bpas_cart_id=ed3ae164d4f4b1e98c577e3418f0335b; bpas_token_cookie=69c46d4b65284b5359de2ecdd129e908; sess=9fjllibv9tmqvbujmk3kqm5fquq09vvm'
    };

    var requestBody = {
      'name': nameController.text,
      'gender': genderController.text,
      'company': companyController.text,
      'phone': phoneController.text,
      'address': addressController.text,
      'code': codeController.text,
      'email': emailController.text
    };

    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://178.128.24.212:9876/mv_research/api/v1/customers/add?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo&'));

    request.fields.addAll(requestBody);
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());

        // Navigate to CustomerPage on success
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustumerPage()),
        );
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post API Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name', border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                items: ['Male', 'Female', 'Other'].map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                decoration: InputDecoration(
                  hintText: 'Select Gender',
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              SizedBox(height: 10,),
              TextField(
                controller: companyController,
                decoration: InputDecoration(
                  labelText: 'Company',
                    border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address', border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: codeController,
                decoration: InputDecoration(
                  labelText: 'Code', border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: postData,
                child: Text('Send POST Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}