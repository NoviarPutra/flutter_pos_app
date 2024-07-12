// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pos_app/app/services/cart_service.dart';

import '../../../models/cart_response_model.dart';

class CartController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  CartService cartService = CartService();
  RxList<DataCartResponse> carts = <DataCartResponse>[].obs;
  RxList<DataCartResponse> cartList = <DataCartResponse>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> initialize() async {
    isLoading.value = true;
    try {
      await fetchCart();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchCart() async {
    try {
      CartResponseModel cart = await cartService.getCart();
      carts.assignAll(cart.data!);
    } catch (e) {
      if (e is DioException) {
        EasyLoading.showError(e.response?.data['message'].toString() ??
            "Terjadi kesalahan, silahkan coba lagi");
      }
    }
  }

  Future<void> submitCart() async {
    try {
      if (cartList.isEmpty) {
        EasyLoading.showError('Pilih Produk terlebih dahulu');
      }
      print(jsonEncode(cartList));
    } catch (_) {}
  }
}
