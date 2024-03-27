// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../model/token_model.dart';
//
// class AccessTokenViewModel extends ChangeNotifier {
//   AuthToken? _authToken;
//
//   AuthToken? get token => _authToken;
//
//   Future<void> fetchToken() async {
//     var headers = {
//       'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
//       'Cookie': 'sess=rahl050o0780o59absk2vpstoioilamq'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('http://159.89.207.207:3303/erp_system/api/v1/auth/login'));
//     request.fields.addAll({
//       'user_name': 'sbcsolutions',
//       'password': 'Sbc@12345'
//     });
//
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//
//
//     // if (response.statusCode == 200) {
//     //   final jsonData = json.decode(response.body);
//     //   _authToken = AuthToken.fromJson(jsonData);
//     //   notifyListeners();
//     // } else {
//     //   throw Exception('Failed to fetch token');
//     // }
//   }
// }