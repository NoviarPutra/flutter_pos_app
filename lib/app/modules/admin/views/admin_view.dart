import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/menu_navigator.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navigatorMenu,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: (value) {
          switch (value) {
            case 0:
              Get.toNamed("/name");
              break;
            case 1:
              Get.toNamed("/history");
              break;
            case 2:
              Get.toNamed("/order");
              break;
            case 3:
              Get.toNamed("/profile");
              break;
            default:
              return;
          }
        },
      ),
    );
  }
}
