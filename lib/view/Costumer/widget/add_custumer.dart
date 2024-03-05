import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbc_app/view/Costumer/Custumer_page.dart';

import '../../home_page.dart';
import 'genderselection.dart';

class AddCustumer extends StatefulWidget {
  const AddCustumer({super.key});

  @override
  State<AddCustumer> createState() => _AddCustumerState();
}

class _AddCustumerState extends State<AddCustumer> {
  var imageFile;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        actions: [
          IconButton(
            onPressed: () {
              _getImageFromSource('camera');
            },
            icon: Icon(Icons.camera_alt_sharp),
          ),
          IconButton(
            onPressed: () {
              _getImageFromSource('gallery');
            },
            icon: Icon(Icons.photo_album),
          ),
        ],
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
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'SBC Sulutions',
                        label: Text('Company Name'),
                        border: OutlineInputBorder(),
                      ),
                    ),
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
                GenderSelectionWidget(),
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
                SizedBox(
                  height: 20.0,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'SengleaphS...@gmail.com',
                      label: Text('Email'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '',
                      label: Text('Address'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '',
                      label: Text('VAT Number'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '',
                      label: Text('Custom Feild 1'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '',
                      label: Text('Custom Feild 2'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustumerPage()));
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
