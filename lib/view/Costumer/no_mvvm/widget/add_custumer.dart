// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sbc_app/data/response/status.dart';
// import 'package:sbc_app/model/customer_model/post_customer_request.dart';
// import 'package:sbc_app/view/Costumer/no_mvvm/Custumer_page.dart';
// import 'package:sbc_app/viewmodel/Customer_viewmodel/Customer_view_model.dart';
// import 'genderselection.dart';
//
// class AddCustomer extends StatefulWidget {
//   AddCustomer({Key? key}) : super(key: key);
//
//   bool? isUpdate;
//
//   @override
//   State<AddCustomer> createState() => _AddCustomerState();
// }
//
// class _AddCustomerState extends State<AddCustomer> {
//   // var imageFile;
//   String? _selectedGender;
//   // var customerImageViewModel = CustumerImageViewModel();
//   var customerViewModel = CustomerViewModel();
//
//   var customerGroupController = TextEditingController();
//   var codeController = TextEditingController();
//   var priceController = TextEditingController();
//   var nameController = TextEditingController();
//   var phoneController = TextEditingController();
//   var emailController = TextEditingController();
//   var addressController = TextEditingController();
//   var companyController = TextEditingController();
//   var genderController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     companyController = TextEditingController();
//     codeController = TextEditingController();
//     priceController = TextEditingController();
//     nameController = TextEditingController();
//     phoneController = TextEditingController();
//     emailController = TextEditingController();
//     addressController = TextEditingController();
//     customerGroupController = TextEditingController();
//     genderController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers here
//     companyController.dispose();
//     codeController.dispose();
//     priceController.dispose();
//     nameController.dispose();
//     phoneController.dispose();
//     emailController.dispose();
//     addressController.dispose();
//     customerGroupController.dispose();
//     genderController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           // actions: [
//           //   IconButton(
//           //     onPressed: () {
//           //       _getImageFromSource('camera');
//           //     },
//           //     icon: Icon(Icons.camera_alt_sharp, color: Colors.green.shade900),
//           //   ),
//           //   IconButton(
//           //     onPressed: () {
//           //       _getImageFromSource('gallery');
//           //     },
//           //     icon: Icon(Icons.photo_album, color: Colors.green.shade900),
//           //   ),
//           // ],
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CustumerPage(),
//                     ));
//               },
//               icon: Icon(Icons.arrow_back, color: Colors.green.shade900)),
//           title: Text(
//             "Add Costumer",
//             style: TextStyle(color: Colors.green.shade900),
//           ),
//           // centerTitle: true,
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Center(
//               child: Column(
//                 children: [
//                   // ChangeNotifierProvider(
//                   //   create: (context) => imageViewModel,
//                   //   child: Consumer<ImageViewModel>(
//                   //       builder: (context, viewModel, _) {
//                   //     switch (viewModel.response.status) {
//                   //       case Status.LOADING:
//                   //         return const Center(
//                   //           child: CircularProgressIndicator(),
//                   //         );
//                   //       case Status.COMPLETED:
//                   //         return Container(
//                   //           height: 200,
//                   //           width: 300,
//                   //           color: Colors.amber,
//                   //           child: imageFile == null
//                   //               ? Image.asset('assets/images/kfc.jpg')
//                   //               : Image.file(imageFile),
//                   //         );
//                   //     default:
//                   //       return const Text('error');
//                   //     }
//                   //   }),
//                   // ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Container(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: TextField(
//                         controller: companyController,
//                         decoration: InputDecoration(
//                           hintText: 'SBC Sulutions',
//                           label: Text('Company Name'),
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   // Container(
//                   //   height: 200,
//                   //   width: 300,
//                   //   // color: Colors.amber,
//                   //   child: imageFile == null
//                   //       ? Image.asset('assets/images/placeholder.png')
//                   //       : Image.file(imageFile),
//                   // ),
//
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Container(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: TextField(
//                         controller: nameController,
//                         decoration: InputDecoration(
//                           hintText: 'Seang Senglea...',
//                           label: Text('Name'),
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: TextField(
//                       controller: genderController,
//                       decoration: InputDecoration(
//                         hintText: '',
//                         label: Text('Gender'),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   // GenderSelectionWidget(),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: TextField(
//                       controller: phoneController,
//                       decoration: InputDecoration(
//                         hintText: '',
//                         label: Text('Phone Number'),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: TextField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         hintText: 'SengleaphS...@gmail.com',
//                         label: Text('Email'),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: TextField(
//                       controller: addressController,
//                       decoration: InputDecoration(
//                         hintText: '',
//                         label: Text('Address'),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: TextField(
//                       controller: customerGroupController,
//                       decoration: InputDecoration(
//                         hintText: '',
//                         label: Text('Customer Group'),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: TextField(
//                       controller: priceController,
//                       decoration: InputDecoration(
//                         hintText: '',
//                         label: Text('Price'),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: TextField(
//                       controller: codeController,
//                       decoration: InputDecoration(
//                         hintText: 'C01104',
//                         label: Text('Code'),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//
//                   ChangeNotifierProvider(
//                       create: (BuildContext context) => customerViewModel,
//                       child: Consumer<CustomerViewModel>(
//                         builder: (context, viewModel, _) {
//                           return ElevatedButton(
//                             onPressed: () {
//                               var requestBody = CustomerModelPost(
//                                 data: Data(
//                                   company: companyController.text,
//                                   name: nameController.text,
//                                   gender: genderController.text,
//                                   phone: phoneController.text,
//                                   email: emailController.text,
//                                   address: addressController.text,
//                                   price: priceController.text,
//                                   code: codeController.text,
//                                 ),
//                               );
//                               viewModel.postCustomer(requestBody);
//                               // Optionally clear text fields
//                               if (viewModel.response.status ==
//                                   Status.COMPLETED) {
//                                 // Navigate to CustomerPage
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => CustumerPage()),
//                                 );
//                               }
//                               // Optionally clear text fields regardless of success/failure
//                               companyController.clear();
//                               nameController.clear();
//                               // Clear other text fields...
//                             },
//                             child: Text("Submit"),
//                           );
//                         },
//                       )),
//
//                   //   ElevatedButton(
//                   //       onPressed: () {
//                   //         var requestBody = CustomerModelRequest(
//                   //             data: Data(
//                   //           company: companyController.text,
//                   //           name: nameController.text,
//                   //           gender: genderController.text,
//                   //           phone: phoneController.text,
//                   //           email: emailController.text,
//                   //           address: addressController.text,
//                   //           price: priceController.text,
//                   //           code: codeController.text,
//                   //         ));
//                   //         customerViewModel.postAllCustomer(requestBody);
//                   //       },
//                   //       child: Consumer<CustomerViewModel>(
//                   //         builder: (context, viewModel, _) {
//                   //           if (viewModel.response.status ==
//                   //               Status.COMPLETED) {
//                   //             WidgetsBinding.instance
//                   //                 .addPostFrameCallback((timeStamp) {
//                   //               ScaffoldMessenger.of(context).showSnackBar(
//                   //                   SnackBar(
//                   //                       content: Text('Post Success')));
//                   //             });
//                   //           }
//                   //           return Text("Submit");
//                   //         },
//                   //       )
//                   // )
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
//
//   // _getImageFromSource(type) async {
//   //   var pickedFile = await ImagePicker().pickImage(
//   //       source: type == 'camera' ? ImageSource.camera : ImageSource.gallery);
//   //   if (pickedFile != null) {
//   //     // print('image is picked ${pickedFile.path}');
//   //     setState(() {
//   //       imageFile = File(pickedFile.path);
//   //     });
//   //     customerImageViewModel.uploadImage(pickedFile.path);
//   //   }
//   // }
// }
