import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos_app/utils/color_pallete.dart';

class ExpiredController extends GetxController {
  GetStorage storage = GetStorage();
  RxString title = 'Expired'.obs;
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
    Future.delayed(
      Duration.zero,
      () {
        Get.dialog(
          PopScope(
            canPop: false,
            child: AlertDialog(
              content: const Text(
                'Sesi anda telah habis,\nSilahkan login kembali.',
              ),
              actions: [
                InkWell(
                  onTap: () => logout(),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          barrierDismissible: false,
        );
      },
    );
  }

  Future<void> logout() async {
    await storage.erase();
    Get.deleteAll();
    Get.offAllNamed('/login');
  }
}
