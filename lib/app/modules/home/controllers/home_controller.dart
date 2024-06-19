import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pos_app/app/models/product_response_model.dart';
import 'package:pos_app/app/services/product_service.dart';

class HomeController extends GetxController {
  static const _pageSize = 12;
  ProductService productService = ProductService();
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  final PagingController<int, DataProductResponse> productPaging =
      PagingController(firstPageKey: 0);
  RxList<DataProductResponse> products = <DataProductResponse>[].obs;

  List<Color> colors = <Color>[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.orange,
    Colors.brown,
    Colors.purple,
    Colors.amber,
  ];

  @override
  void onInit() {
    super.onInit();
    productPaging.addPageRequestListener((pageKey) {
      fetchPageProduct(pageKey);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchPageProduct(int pageKey) async {
    try {
      final params = {
        'limit': _pageSize,
        'skip': pageKey,
      };
      final response = await productService.getProducts(params: params);
      final isLastPage = response.data!.length < _pageSize;
      print(params);
      if (isLastPage) {
        productPaging.appendLastPage(response.data!);
      } else {
        final nextPageKey = pageKey + response.data!.length;

        productPaging.appendPage(response.data!, nextPageKey);
      }
    } catch (e) {
      productPaging.error = e;
    }
  }
}
