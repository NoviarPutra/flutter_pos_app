import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pos_app/app/modules/home/views/product_detail.dart';
import 'package:pos_app/app/modules/home/widgets/card_product.dart';
import 'package:pos_app/app/widgets/basic_icon_button.dart';

import '../../../models/product_response_model.dart';
import '../../../widgets/menu_navigator.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () => Future.sync(
                        controller.productPaging.refresh,
                      ),
                      child: PagedGridView(
                        pagingController: controller.productPaging,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 0.7,
                        ),
                        builderDelegate:
                            PagedChildBuilderDelegate<DataProductResponse>(
                          itemBuilder: (context, item, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                  () => ProductDetailScreen(
                                    productId: item.id.toString(),
                                    url: item.image.toString(),
                                  ),
                                );
                              },
                              child: cardProduct(
                                productName: item.name.toString(),
                                price: item.price.toString(),
                                stock: item.stock.toString(),
                                url: item.image.toString(),
                              ),
                            );
                          },
                          noItemsFoundIndicatorBuilder: (BuildContext context) {
                            return const Center(
                              child: Text('No items found'),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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
