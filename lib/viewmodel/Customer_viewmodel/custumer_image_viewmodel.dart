// import 'package:flutter/material.dart';
//
// import '../../data/response/api_response.dart';
// import '../../repository/customer_repo/upload_repo_cus.dart';
//
// class CustumerImageViewModel extends ChangeNotifier {
//   var _imageRepo = UploadImageRepository();
//   dynamic response = ApiResponse();
//
//   setImageResponse(response) {
//     this.response = response;
//     notifyListeners();
//   }
//
//   Future<dynamic> uploadImage(file) async {
//     setImageResponse(ApiResponse.loading());
//     await _imageRepo
//         .uploadImage(file)
//         .then((value) => setImageResponse(ApiResponse.completed(value)))
//         .onError((error, stackTrace) =>
//         setImageResponse(ApiResponse.error(stackTrace.toString())));
//   }
// }