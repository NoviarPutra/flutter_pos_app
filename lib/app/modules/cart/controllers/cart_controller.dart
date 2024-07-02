import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pos_app/app/services/cart_service.dart';

import '../../../models/cart_response_model.dart';

class CartController extends GetxController {
  static const int _pageSize = 10;
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  CartService cartService = CartService();
  final PagingController<int, DataCartResponse> cartPaging =
      PagingController(firstPageKey: 0);

  RxList<DataCartResponse> cartList = <DataCartResponse>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    cartPaging.addPageRequestListener((pageKey) {
      fetchCart(pageKey);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchCart(int pageKey) async {
    try {
      final params = {
        'limit': _pageSize,
        'skip': pageKey,
      };
      final response = await cartService.getCart(params: params);
      final isLastPage = response.data!.length < _pageSize;
      if (isLastPage) {
        cartPaging.appendLastPage(response.data!);
      } else {
        final nextPageKey = pageKey + response.data!.length;
        cartPaging.appendPage(response.data!, nextPageKey);
      }
    } catch (e) {
      cartPaging.error = e;
    }
  }

  Future<void> submitCart() async {
    try {
      if (cartList.isEmpty) {
        EasyLoading.showError('Pilih Produk terlebih dahulu');
      }
    } catch (e) {
      print(e);
    }
  }
}
