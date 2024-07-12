import 'package:get/get.dart';

import '../controllers/expired_controller.dart';

class ExpiredBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpiredController>(
      () => ExpiredController(),
    );
  }
}
