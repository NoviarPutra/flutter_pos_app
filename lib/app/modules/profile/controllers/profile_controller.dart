import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  GetStorage storage = GetStorage();
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

  Future<void> logout() async {
    await storage.erase();
    Get.deleteAll();
    Get.offAllNamed('/login');
  }
}
