import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/app/modules/home/controllers/product_detail_controller.dart';
import 'package:pos_app/app/widgets/basic_elevated_icon_button.dart';
import 'package:pos_app/app/widgets/button_counter.dart';
import 'package:pos_app/utils/color_pallete.dart';

import '../../../widgets/basic_icon_button.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    required this.productId,
    required this.productName,
    required this.stock,
    required this.price,
    required this.description,
    required this.url,
    super.key,
  });

  final String productId;
  final String productName;
  final String stock;
  final String price;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    ProductDetailController controller = Get.put(ProductDetailController(
      price: int.parse(price),
    ));
    return Scaffold(
      appBar: AppBar(
        leading: BasicIconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            url,
            fit: BoxFit.fill,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.35),
          child: const SizedBox(),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                productName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rp. $price",
                    style: const TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Stock : $stock",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: Get.height * 0.08,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: Get.width * 0.1, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(
                  () => ButtonCounter(
                    counter: controller.quantity.value,
                    onIncrement: () => controller.incrementQuantity(),
                    onDecrement: () => controller.decrementQuantity(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(
                  () => BasicElevatedButtonIcon(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    title: 'Rp. ${controller.priceValue.value}',
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
