import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sbc_app/model/customer_model/costumer_model.dart';
import 'package:sbc_app/model/customer_model/post_customer_request.dart';

import '../Custumer_page.dart';

class NoMvvmUpdateCustomer extends StatelessWidget {
  CustomerModelPost customerModelPost;

  NoMvvmUpdateCustomer({required this.customerModelPost, Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController companyController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController codeController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    // Initialize text controllers with old data
    // nameController.text = '${customerModelPost.data?.name}';
    // companyController.text = '${customerModelPost.data?.company}';
    // phoneController.text = '${customerModelPost.data?.phone}';
    // addressController.text = '${customerModelPost.data?.address}';
    // codeController.text = '${customerModelPost.data?.code}';
    // emailController.text = '${customerModelPost.data?.email}';
    // String? _selectedGender = customerModelPost.data?.gender;

    // Future<void> updateData() async {
    //   var headers = {
    //     // 'Content-Type': 'application/json',
    //     'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
    //     'Cookie':
    //     'bpas_cart_id=ed3ae164d4f4b1e98c577e3418f0335b; bpas_token_cookie=69c46d4b65284b5359de2ecdd129e908; sess=9fjllibv9tmqvbujmk3kqm5fquq09vvm'
    //   };
    //
    //   var requestBody = {
    //     'name': nameController.text,
    //     'gender': genderController.text,
    //     'company': companyController.text,
    //     'phone': phoneController.text,
    //     'address': addressController.text,
    //     'code': codeController.text,
    //     'email': emailController.text
    //   };
    //
    //   var url =
    //       'http://178.128.24.212:9876/mv_research/api/v1/customers/edit/${customerModelPost!.data?.id}?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssoo&';
    //
    //   try {
    //     http.Response response = await http.post(
    //       Uri.parse(url),
    //       headers: headers,
    //       body: requestBody,
    //     );
    //
    //     if (response.statusCode == 200) {
    //       print(response.body);
    //
    //       // Navigate to CustomerPage on success
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => CustumerPage()),
    //       );
    //     } else {
    //       print('Request failed with status: ${response.statusCode}');
    //     }
    //   } catch (e) {
    //     print('Error: $e');
    //   }
    // }

    Future<void> updateData() async {
      var headers = {
        'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
        'Cookie':
        'bpas_cart_id=ed3ae164d4f4b1e98c577e3418f0335b; bpas_token_cookie=69c46d4b65284b5359de2ecdd129e908; sess=9fjllibv9tmqvbujmk3kqm5fquq09vvm'
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

      var url =
          'http://178.128.24.212:9876/mv_research/api/v1/customers/edit/${customerModelPost.data!.id}?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssoo';

      try {
        http.Response response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: requestBody,
        );

        if (response.statusCode == 200) {
          print('Data updated successfully');
          // Optionally, you can handle the response data here
          // For example, if the server returns updated data, you can parse and use it
          // Navigate to CustomerPage on success
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustumerPage()),
          );
        } else {
          // Request failed with an error code
          print('Request failed with status: ${response.statusCode}');
          // Optionally, you can handle different error scenarios here
        }
      } catch (e) {
        // An error occurred during the request
        print('Error: $e');
        // Optionally, you can show an error message to the user or retry the request
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Update Customer Data'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${customerModelPost!.data?.id}'),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                // value: _selectedGender,
                items: ['Male', 'Female', 'Other'].map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Gender'),
                onChanged: (value) {
                  // _selectedGender = value;
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: companyController,
                decoration: InputDecoration(labelText: 'Company'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: codeController,
                decoration: InputDecoration(labelText: 'Code'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: updateData,
                child: Text('Update Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:sbc_app/model/customer_model/costumer_model.dart';
//
// import '../Custumer_page.dart';
//
// class NoMvvmUpdateCustomer extends StatefulWidget {
//   CustomerModel? customerModel;
//
//   NoMvvmUpdateCustomer({Key? key, required this.customerModel}) : super(key: key);
//
//   @override
//   _NoMvvmUpdateCustomerState createState() => _NoMvvmUpdateCustomerState();
// }
//
// class _NoMvvmUpdateCustomerState extends State<NoMvvmUpdateCustomer> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController genderController = TextEditingController();
//   final TextEditingController companyController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController codeController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize text controllers with old data
//     nameController.text = '${widget.customerModel!.name}';
//     companyController.text = '${widget.customerModel!.company}';
//     phoneController.text = '${widget.customerModel!.phone}';
//     addressController.text = '${widget.customerModel!.address}';
//     codeController.text = '${widget.customerModel!.code}';
//     emailController.text = '${widget.customerModel!.email}';
//     _selectedGender = widget.customerModel!.gender;
//   }
//
//   Future<void> updateData() async {
//     var headers = {
//       // 'Content-Type': 'application/json',
//       'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
//       'Cookie':
//       'bpas_cart_id=ed3ae164d4f4b1e98c577e3418f0335b; bpas_token_cookie=69c46d4b65284b5359de2ecdd129e908; sess=9fjllibv9tmqvbujmk3kqm5fquq09vvm'
//     };
//
//     var requestBody = {
//       'name': nameController.text,
//       'gender': genderController.text,
//       'company': companyController.text,
//       'phone': phoneController.text,
//       'address': addressController.text,
//       'code': codeController.text,
//       'email': emailController.text
//     };
//
//     var url =
//         'http://178.128.24.212:9876/mv_research/api/v1/customers/edit/${widget.customerModel!.id}?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssoo';
//
//     try {
//       http.Response response = await http.post(
//         Uri.parse(url),
//         headers: headers,
//         body: requestBody,
//       );
//
//       if (response.statusCode == 200) {
//         print(response.body);
//
//         // Navigate to CustomerPage on success
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => CustumerPage()),
//         );
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   String? _selectedGender;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Customer Data'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 value: _selectedGender,
//                 items: ['Male', 'Female', 'Other'].map((gender) {
//                   return DropdownMenuItem<String>(
//                     value: gender,
//                     child: Text(gender),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Gender'),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGender = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 controller: companyController,
//                 decoration: InputDecoration(labelText: 'Company'),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 controller: phoneController,
//                 decoration: InputDecoration(labelText: 'Phone'),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 controller: addressController,
//                 decoration: InputDecoration(labelText: 'Address'),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 controller: codeController,
//                 decoration: InputDecoration(labelText: 'Code'),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: updateData,
//                 child: Text('Update Data'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
