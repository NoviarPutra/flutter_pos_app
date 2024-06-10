import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_app/utils/color_pallete.dart';

import '../../../../widgets/menu_navigator.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Application',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                // color: Colors.white,
              ),
            ),
          ],
          // backgroundColor: primary,
        ),
        body: Obx(
          () => contentItems.elementAt(controller.selectedIndex.value),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: navigatorMenu,
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: primary,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            onTap: (value) => controller.selectedIndex.value = value,
          ),
        ),
      ),
    );
  }
}
