import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbc_app/view/report/report_page.dart';

import '../../Costumer/no_mvvm/widget/genderselection.dart';
import '../../sales_surveys/no_mvvm/widget/date_picker.dart';

class AddReport extends StatefulWidget {
  const AddReport({super.key});

  @override
  State<AddReport> createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  var imageFile;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ReportPage(),));
            },
            icon: Icon(Icons.arrow_back,color: Colors.black)),
        title: Text(
          "Add Report", style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // ChangeNotifierProvider(
                //   create: (context) => imageViewModel,
                //   child: Consumer<ImageViewModel>(
                //       builder: (context, viewModel, _) {
                //     switch (viewModel.response.status) {
                //       case Status.LOADING:
                //         return const Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       case Status.COMPLETED:
                //         return Container(
                //           height: 200,
                //           width: 300,
                //           color: Colors.amber,
                //           child: imageFile == null
                //               ? Image.asset('assets/images/kfc.jpg')
                //               : Image.file(imageFile),
                //         );
                //     default:
                //       return const Text('error');
                //     }
                //   }),
                // ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    // child: TextField(
                    //   decoration: InputDecoration(
                    //     hintText: 'SBC Sulutions',
                    //     label: Text('Company Name'),
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 200,
                  width: 300,
                  // color: Colors.amber,
                  child: imageFile == null
                      ? Image.asset('assets/images/placeholder.png')
                      : Image.file(imageFile),
                ),

                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Seang Senglea...',
                        label: Text('Name'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                DatePickerPage(),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '',
                      label: Text('Phone Number'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                //
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: 'SengleaphS...@gmail.com',
                //       label: Text('Email'),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: '',
                //       label: Text('Address'),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: '',
                //       label: Text('VAT Number'),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: '',
                //       label: Text('Custom Feild 1'),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: '',
                //       label: Text('Custom Feild 2'),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReportPage()));
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getImageFromSource(type) async {
    var pickedFile = await ImagePicker().pickImage(
        source: type == 'camera' ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      // print('image is picked ${pickedFile.path}');
      setState(() {
        imageFile = File(pickedFile.path);
      });
      // imageViewModel.uploadImage(pickedFile.path);
    }
  }
}