import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../data/dio.dart';
import '../models/cart_response_model.dart';

class CartService {
  static CartService? _instance;
  factory CartService() => _instance ??= CartService._();
  CartService._();

  Future<CartResponseModel> getCart({Map<String, dynamic>? params}) async {
    final service = DioInstance().service;
    GetStorage box = GetStorage();
    String token = box.read('token');
    final response = await service.get(
      '/cart',
      queryParameters: params,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return CartResponseModel.fromJson(response.data);
  }
}
