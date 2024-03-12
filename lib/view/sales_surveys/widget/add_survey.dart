import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbc_app/view/Costumer/Custumer_page.dart';
import 'package:sbc_app/view/sales_surveys/sale_survey_page.dart';
import 'package:sbc_app/view/sales_surveys/widget/date_picker.dart';
import 'package:sbc_app/view/sales_surveys/widget/salesman.dart';

import '../../home_page.dart';

class AddSuveryPage extends StatefulWidget {
  const AddSuveryPage({super.key});

  @override
  State<AddSuveryPage> createState() => _AddSuveryPageState();
}

class _AddSuveryPageState extends State<AddSuveryPage> {
  var imageFile;
  late String _selectedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SaleSurveyPage(),));
            },
            icon: Icon(Icons.arrow_back,color: Colors.black)),
        title: Text(
          "Add Survey", style: TextStyle(color: Colors.black),
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
                DatePickerPage(),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Custumer Name',
                        label: Text('Custumer.'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SalesManPage(),
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
                        hintText: '',
                        label: Text(' Product Name'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                //
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: '',
                //       label: Text('Phone Number'),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SaleSurveyPage()));
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
