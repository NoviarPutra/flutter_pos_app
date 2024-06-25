import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pos_app/app/services/authentication_service.dart';

class RegisterController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  AuthenticationService authService = AuthenticationService();
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;
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

  Future<void> register() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      EasyLoading.show(status: 'Memuat...');
      isLoading.value = true;
      try {
        final formData = formKey.currentState?.value;
        final response = await authService.register(data: formData);
        EasyLoading.showSuccess(response.message.toString());
        Get.offAllNamed('/login');
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
