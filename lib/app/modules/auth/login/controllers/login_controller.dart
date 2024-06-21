import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
        final payload = {
          'email': formData?['email'],
          'password': formData?['password'],
        };
        final response = await authService.login(data: payload);
        EasyLoading.showSuccess(response.message.toString());
        storage.write('isLogin', true);
        Get.offAllNamed('/home');
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
