import 'package:flutter/material.dart';
import 'package:sbc_app/repository/product_repo/product_repo.dart';
import '../../data/response/api_response.dart';

class ProductViewModel extends ChangeNotifier {
  final _productRepo = ProductRepository();

  dynamic response = ApiResponse.loading();
  setProductList(response) {
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> getAllProducts() async {
    await _productRepo.getProducts().then((products) {
      setProductList(ApiResponse.completed(products));
    }).onError((error, stackTrace) =>
        setProductList(ApiResponse.error(stackTrace.toString())));
  }
}