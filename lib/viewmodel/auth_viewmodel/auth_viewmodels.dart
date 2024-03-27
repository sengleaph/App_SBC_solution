import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/auth_model/UserModel.dart';
import '../../repository/auth_repo/auth_repository.dart';
import 'services/session_manager/session_controller.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  late UserModel _token;


  bool _loading = false;
  bool get loading => _loading;

  UserModel get token => _token;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String? _user_name='sbcsolutions';
  String? _password='Sbc@12345s';


  String? get user_name => _user_name;

  setUser_name(String? value) {
    _user_name = value;
  }

  String? get password => _password;

  setPassword(String? value) {
    _password = value;
  }

  Future<UserModel> loginApi(dynamic data, BuildContext context) async {
    try {
      final response = await _myRepo.loginApi(data);
      if (response != null) {
        if (response.statusCode == 400) {
          // Handle "Bad Request" status
          throw Exception('Bad Request: ${response.reasonPhrase}');
        }
        await SessionController().saveUserInPreference(response);
        await SessionController().getUserFromPreference();
        return response;
      } else {
        throw Exception('Null response received');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }



// Future<UserModel> loginApi( data, BuildContext context) async {
//
//   try {
//     // setLoginLoading(true);
//     final response = await _myRepo.loginApi(data);
//     await SessionController().saveUserInPreference(response);
//     await SessionController().getUserFromPreference();
//     // setLoginLoading(false);
//     return response ;
//   }catch(e){
//     // setLoginLoading(false);
//     throw Exception(e.toString());
//   }
//
// }



// Future<void> loginApi(data, context) async {
//   setLoading(true);
//   try {
//     final value = await _myRepo.loginApi(data);
//     setLoading(false);
//
//     var headers = {
//       'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
//       'Cookie': 'sess=rahl050o0780o59absk2vpstoioilamq'
//     };
//     final response = await http.post(
//       Uri.parse('http://159.89.207.207:3303/erp_system/api/v1/auth/login'),
//       headers: headers,
//       body: {
//         'user_name': 'sbcsolutions',
//         'password': 'Sbc@12345'
//       },
//     );
//
//     if (response != null && response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       if (jsonResponse != null && jsonResponse['status'] == true) {
//         final userData = jsonResponse['data'];
//         _token = UserModel.fromJson(userData);
//         if (kDebugMode) {
//           Utils.flushBarErrorMessage('Log in Successfully', context);
//           print(value.toString());
//         }
//       } else {
//         // Handle unsuccessful login
//         if (kDebugMode) {
//           final errorMessage = jsonResponse != null ? jsonResponse['message'] : 'Unknown error';
//           Utils.flushBarErrorMessage(errorMessage, context);
//           print(errorMessage);
//         }
//       }
//     } else {
//       // Handle other HTTP status codes
//       if (kDebugMode) {
//         Utils.flushBarErrorMessage('HTTP Error: ${response?.reasonPhrase}', context);
//         print('HTTP Error: ${response?.reasonPhrase}');
//       }
//     }
//   } catch (error) {
//     // Handle other errors
//     setLoading(false);
//     if (kDebugMode) {
//       Utils.flushBarErrorMessage(error.toString(), context);
//       print(error.toString());
//     }
//   }
// }


}
