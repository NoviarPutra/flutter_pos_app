import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_app/utils/color_pallete.dart';

import '../../../../utils/menu_navigator.dart';
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
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: primaryDark,
        ),
        body: Obx(
          () => Center(
            child: contentItems.elementAt(controller.selectedIndex.value),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: navigatorMenu,
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: primary,
            onTap: (value) => controller.selectedIndex.value = value,
          ),
        ),
      ),
    );
  }
}
