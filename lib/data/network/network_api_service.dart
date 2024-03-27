import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sbc_app/model/customer_model/post_customer_request.dart';

import '../handle_error/app_exception.dart';
import 'api_service.dart';

class NetworkApiService implements BaseApiService {
  dynamic responseJson;

  // login authentication
  @override
  Future getGetApiResponse(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  //============================================================================

// login authentication
  @override
  Future<dynamic> getPostApiResponse(url, data) async {
    var headers = {
      'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
      'Cookie': 'sess=sgs6j8lvudmbv2nk6n970f3fafbmlc1v'
    };

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields
        .addAll({'user_name': 'sbcsolutions', 'password': 'Sbc@12345'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  //============================================================================

  //fetch API
  // @override
  Future<dynamic> getApiResponse(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('Your internet connection is error');
    }
    return responseJson;
  }

  //============================================================================

  //post image
  Future<dynamic> uploadImageService(url, file) async {
    var request = http.Request('GET', Uri.parse(url));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
//==============================================================================

  //post api
  Future<dynamic> postApi(url, requestBody) async {
    var headers = {
      'api-key': '4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo',
      'Cookie': 'bpas_cart_id=ed3ae164d4f4b1e98c577e3418f0335b; sess=q4jq16iuits5q37ao1c16k4cm71fn96d'
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(requestBody);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }



  // ===========================================================================

  returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        // dynamic responseJson = jsonDecode(response.body);
        print('json.decode ${json.decode(response.body)}');
        return json.decode(response.body);
      // return responseJson ;
      case 400:
        print('error is on: ${response.body.toString()}');
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }
}
