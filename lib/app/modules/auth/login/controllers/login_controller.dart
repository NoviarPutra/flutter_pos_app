import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos_app/app/models/login_response_model.dart';
import 'package:pos_app/app/services/authentication_service.dart';

class LoginController extends GetxController {
  GetStorage storage = GetStorage();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  AuthenticationService authService = AuthenticationService();
  RxBool obscureText = true.obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      EasyLoading.show(status: 'Memuat...');
      isLoading.value = true;
      try {
        final formData = formKey.currentState?.value;
        final response = await authService.login(data: formData);
        EasyLoading.showSuccess(response.message.toString());
        DataLoginResponse userLogin = response.data!;
        storage.write('isLogin', true);
        storage.write('token', response.token);
        storage.write('user', jsonEncode(userLogin.toJson()));
        if (response.data!.role == 'ADMIN') {
          Get.offAllNamed('/admin');
        } else {
          Get.offAllNamed('/home');
        }
      } catch (e) {
        if (e is DioException) {
          EasyLoading.showError(e.response?.data['message'].toString() ??
              "Terjadi kesalahan, silahkan coba lagi");
        }
      } finally {
        EasyLoading.dismiss();
        isLoading.value = false;
      }
    }
  }
}
