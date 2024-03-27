// // import 'package:flutter/material.dart';
// // import 'package:sbc_app/repository/customer_repo/Customer_repository.dart';
// //
// // import '../../data/response/api_response.dart';
// // import '../../model/customer_model/post_customer_request.dart';
// //
// // // class CustomerViewModel extends ChangeNotifier {
// // //   final _custumerRepo = CustomerRepository();
// // //
// // //   dynamic response = ApiResponse.loading();
// // //   setCustomerList(response) {
// // //     this.response = response;
// // //     notifyListeners();
// // //   }
// // //
// // //   Future<dynamic> postAllCustomer(requestBody) async {
// // //     setCustomerList(ApiResponse.loading());
// // //     await _custumerRepo.postCustomer(requestBody).then((customers) {
// // //       setCustomerList(ApiResponse.completed(customers));
// // //     }).onError((error, stackTrace) =>
// // //         setCustomerList(ApiResponse.error(stackTrace.toString())));
// // //   }
// // // }
// //
// // class CustomerViewModel extends ChangeNotifier {
// //   final _customerRepo = CustomerRepository();
// //
// //   dynamic response = ApiResponse.loading();
// //
// //   setCustomerList(ApiResponse response) {
// //     this.response = response;
// //     notifyListeners();
// //   }
// //
// //   Future<void> postAllCustomer(CustomerModelRequest requestBody) async {
// //     setCustomerList(ApiResponse.loading());
// //     try {
// //       final customers = await _customerRepo.postCustomer(requestBody);
// //       setCustomerList(ApiResponse.completed(customers));
// //     } catch (error, stackTrace) {
// //       setCustomerList(ApiResponse.error(stackTrace.toString()));
// //     }
// //   }
// //
// //
// //
// // }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:sbc_app/data/response/api_response.dart';
// import 'package:sbc_app/model/customer_model/post_customer_request.dart';
//
// import '../../repository/customer_repo/Customer_repository.dart';
//
// class CustomerViewModel extends ChangeNotifier {
//   final CustomerRepository _customerRepository = CustomerRepository();
//
//   ApiResponse _response = ApiResponse.loading();
//
//   ApiResponse get response => _response;
//
//   set response(ApiResponse response) {
//     _response = response;
//     notifyListeners();
//   }
//
//   Future<void> postCustomer(requestBody) async {
//     try {
//       response = ApiResponse.loading();
//       final result = await _customerRepository.postCustomer(requestBody);
//       // Handle the response accordingly, update response status
//       response = ApiResponse.completed(result);
//     } catch (e) {
//       response = ApiResponse.error(e.toString());
//     }
//   }
// }
