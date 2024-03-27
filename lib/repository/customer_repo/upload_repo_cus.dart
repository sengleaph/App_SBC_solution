// import 'package:sbc_app/data/network/network_api_service.dart';
// import 'package:sbc_app/model/customer_model/post_custumer_response.dart';
// import 'package:sbc_app/res/app_url.dart';
//
// class UploadImageRepository {
//   final _apiService = NetworkApiService();
//
//   Future<AddCustomerResponse> uploadImage(file) async{
//     try{
//       dynamic response = await _apiService.uploadImageService(AppUrl.insertCustomer, file  );
//       return response;
//     }catch(e){
//       rethrow;
//     }
//   }
// }