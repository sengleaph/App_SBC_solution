import '../../data/network/api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../model/product_model/product_model.dart';
import '../../res/app_url.dart';

class ProductRepository {
  // final BaseApiService _apiService = NetworkApiService();
  final _apiService = NetworkApiService();
  Future<ProductModel> getProducts() async{
    try{
      dynamic responses = await
      _apiService.getApiResponse(AppUrl.getAllProducts);
      print('response ${responses["data"][0]["name"]}');
      // print('response in model ${ProductModel.fromJson(responses)}');
      return ProductModel.fromJson(responses);
    }
    catch(e){
      rethrow;
    }
  }

}