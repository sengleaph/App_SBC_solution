
abstract class BaseApiService{
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  // Future<dynamic> getApiCustomer(String url) ;
  // Future<dynamic> getApiResponse(String url);
}