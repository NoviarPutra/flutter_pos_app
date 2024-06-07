import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_app/utils/color_pallete.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: builderDrawer(),
          backgroundColor: primaryDark,
        ),
        drawer: Drawer(
          width: Get.width * 0.5,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: primary,
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "HEADER DRAWER",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        title: const Text("Home"),
                        leading: const Icon(Icons.home),
                      ),
                      ListTile(
                        onTap: () {},
                        title: const Text("Categories"),
                        leading: const Icon(Icons.category),
                      ),
                      ListTile(
                        onTap: () {},
                        title: const Text("Products"),
                        leading: const Icon(Icons.list),
                      ),
                      ListTile(
                        onTap: () {},
                        title: const Text("Settings"),
                        leading: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: primary,
                ),
                child: ListTile(
                  onTap: () {},
                  title: const Text("Logout",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget builderDrawer() {
    return Builder(
      builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    );
  }
}
