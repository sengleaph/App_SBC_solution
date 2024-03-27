import 'package:http/http.dart';

import '../../data/network/api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../res/app_url.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      Response response =
      await _apiService.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
