import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/token_model.dart';
import '../../repository/auth_repo/auth_repository.dart';
import '../../util/auth/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  late AuthToken _token;


  bool _loading = false;
  bool get loading => _loading;

  AuthToken get token => _token;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) async {
      var headers = {
        'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
        'Cookie': 'sess=rahl050o0780o59absk2vpstoioilamq'
      };
      final request = http.MultipartRequest('POST', Uri.parse('http://159.89.207.207:3303/erp_system/api/v1/auth/login'));
      request.fields.addAll({
        'user_name': 'sbcsolutions',
        'password': 'Sbc@12345'
      });
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }

      setLoading(true);
      if (kDebugMode) {
        Utils.flushBarErrorMessage('Log in Successfully', context);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(true);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
