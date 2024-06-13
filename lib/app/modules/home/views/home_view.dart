import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:pos_app/app/modules/home/views/product_detail.dart';
import 'package:pos_app/app/modules/home/widgets/card_product.dart';
import 'package:pos_app/app/widgets/basic_icon_button.dart';

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
            basicIconButton(
                icon: const Icon(Icons.shopping_bag_outlined), onPressed: () {})
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FormBuilder(
                  child: FormBuilderTextField(
                    name: 'search',
                    decoration: const InputDecoration(
                      labelText: 'Searchmenu...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.colors.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: controller.colors[index],
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          "Menu",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(
                            6,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                    ProductDetailScreen(
                                      productId: index.toString(),
                                    ),
                                  );
                                },
                                child: cardProduct(
                                  decorationColor: controller.colors[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
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
            }),
      ),
    );
  }
}
