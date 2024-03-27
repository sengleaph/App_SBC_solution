import 'package:flutter/material.dart';
import 'package:sbc_app/model/customer_model/costumer_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../util/auth/utils.dart';

class NoMvvmUpdateCustomer extends StatefulWidget {
  final CustomerModel customerModel;
  final void Function(CustomerModel updatedCustomerModel) onUpdate;

  NoMvvmUpdateCustomer(
      {Key? key, required this.customerModel, required this.onUpdate})
      : super(key: key);

  @override
  State<NoMvvmUpdateCustomer> createState() => _NoMvvmUpdateCustomerState();
}

class _NoMvvmUpdateCustomerState extends State<NoMvvmUpdateCustomer> {
  late TextEditingController nameController;
  late TextEditingController genderController;
  late TextEditingController companyController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController codeController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with data from customerModel
    nameController = TextEditingController(text: widget.customerModel.name);
    genderController = TextEditingController(text: widget.customerModel.gender);
    companyController =
        TextEditingController(text: widget.customerModel.company);
    phoneController = TextEditingController(text: widget.customerModel.phone);
    addressController =
        TextEditingController(text: widget.customerModel.address);
    codeController = TextEditingController(text: widget.customerModel.code);
    emailController = TextEditingController(text: widget.customerModel.email);

    // Log data to the console
    print('Customer ID: ${widget.customerModel.id}');
    print('Name: ${widget.customerModel.name}');
    print('Address: ${widget.customerModel.address}');
    print('Company: ${widget.customerModel.company}');
    print('Gender: ${widget.customerModel.gender}');
    print('Email: ${widget.customerModel.email}');
    print('Code: ${widget.customerModel.code}');
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    nameController.dispose();
    genderController.dispose();
    companyController.dispose();
    phoneController.dispose();
    addressController.dispose();
    codeController.dispose();
    emailController.dispose();
    super.dispose();
  }

  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: Text('Edit Customer', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Name', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                items: ['Male', 'Female', 'Other'].map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                decoration: InputDecoration(
                    labelText: 'Gender', border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: companyController,
                decoration: InputDecoration(
                    labelText: 'Company', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: 'Phone', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                    labelText: 'Address', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: codeController,
                decoration: InputDecoration(
                    labelText: 'Code', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green.shade900),
                  ),
                  onPressed: () async {
                    var id = widget.customerModel
                        .id; // Assuming id is accessible from the customerModel

                    var headers = {
                      'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
                      'Cookie': 'bpas_cart_id=ed3ae164d4f4b1e98c577e3418f0335b',
                    };

                    var request = http.MultipartRequest(
                        'POST',
                        Uri.parse(
                            'http://178.128.24.212:9876/mv_research/api/v1/customers/edit/$id?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssoo'));

                    request.fields.addAll({
                      'name': nameController.text,
                      'gender': genderController.text,
                      'company': companyController.text,
                      'phone': phoneController.text,
                      'address': addressController.text,
                      'code': codeController.text,
                      'email': emailController.text,
                    });

                    request.headers.addAll(headers);

                    try {
                      http.StreamedResponse response = await request.send();

                      if (response.statusCode == 200) {
                        var responseBody =
                            await response.stream.bytesToString();
                        var jsonResponse = json.decode(responseBody);
                        var updatedCustomerModel =
                            CustomerModel.fromJson(jsonResponse);
                        widget.onUpdate(updatedCustomerModel);
                        // Process jsonResponse if needed
                        print(jsonResponse);
                        Navigator.pop(context);
                        Utils.flushBarSuccessMessage(
                            'Customer successfully updated', context);
                      } else {
                        print(
                            'Failed to update customer data: ${response.reasonPhrase}');
                      }
                    } catch (e) {
                      print('Error updating customer data: $e');
                    }
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
