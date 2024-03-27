import 'package:sbc_app/model/customer_model/post_customer_request.dart';

import '../../data/network/network_api_service.dart';
import '../../model/customer_model/costumer_model.dart';
import '../../res/app_url.dart';

class CustomerRepository {
  final _apiService = NetworkApiService();

  Future<dynamic> postCustomer(requestBody) async {
    try {
      // var customerModelRequest = CustomerModelRequest(data: requestBody);
      final response =
          await _apiService.postApi(AppUrl.insertCustomer, requestBody);
      print('response in model ${response}');
      return response;
    } catch (e) {
      print('Error in postCustomer: $e');
      rethrow;
    }
  }
}
