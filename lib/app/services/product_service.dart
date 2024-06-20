import 'package:pos_app/app/data/dio.dart';

import '../models/product_response_model.dart';

class ProductService {
  static ProductService? _instance;
  factory ProductService() => _instance ??= ProductService._();
  ProductService._();

  Future<ProductsResponseModel> getProducts(
      {Map<String, dynamic>? params}) async {
    final service = DioInstance().service;
    final response = await service.get('/products', queryParameters: params);
    return ProductsResponseModel.fromJson(response.data);
  }
}
