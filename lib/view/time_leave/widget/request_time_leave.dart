import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbc_app/view/Costumer/Custumer_page.dart';
import 'package:sbc_app/view/sales_surveys/sale_survey_page.dart';
import 'package:sbc_app/view/sales_surveys/widget/date_picker.dart';
import 'package:sbc_app/view/sales_surveys/widget/salesman.dart';
import 'package:sbc_app/view/time_leave/time_leave_page.dart';
import 'package:sbc_app/view/time_leave/widget/time_shift.dart';
import 'package:sbc_app/view/time_leave/widget/type_leave.dart';

import '../../home_page.dart';

class RequestTimeLeavePage extends StatefulWidget {
  const RequestTimeLeavePage({super.key});

  @override
  State<RequestTimeLeavePage> createState() => _RequestTimeLeavePageState();
}

class _RequestTimeLeavePageState extends State<RequestTimeLeavePage> {
  var imageFile;
  late String _selectedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TimeLeavePage(),));
            },
            icon: Icon(Icons.arrow_back,color: Colors.black)),
        title: Text(
          "Leave", style: TextStyle(color: Colors.black),
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
                DatePickerPage(),
                SizedBox(
                  height: 20.0,
                ),
                TimeShiftPage(),
                SizedBox(
                  height: 20.0,
                ),
                TypeLeavePage(),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Today, I would like to a...',
                        label: Text('Reason'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

                // Container(
                //   height: 200,
                //   width: 300,
                //   // color: Colors.amber,
                //   child: imageFile == null
                //       ? Image.asset('assets/images/placeholder.png')
                //       : Image.file(imageFile),
                // ),

                // SizedBox(
                //   height: 20.0,
                // ),
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 15),
                //     child: TextField(
                //       decoration: InputDecoration(
                //         hintText: '',
                //         label: Text(' Product Name'),
                //         border: OutlineInputBorder(),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeLeavePage()));
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
