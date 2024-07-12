import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:pos_app/app/widgets/basic_cart_list.dart';
import 'package:pos_app/app/widgets/basic_elevated_icon_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Obx(
        () => Skeletonizer(
          enabled: controller.isLoading.value,
          enableSwitchAnimation: true,
          child: ListView.builder(
            itemCount: controller.carts.isEmpty ? 1 : controller.carts.length,
            itemBuilder: (context, index) {
              if (controller.carts.isEmpty) {
                return const Center(
                  child: Text('No carts available'),
                );
              }
              String imageUrl = controller.carts[index].productImage ?? '';
              String name = controller.carts[index].productName ?? '';
              String total = controller.carts[index].totalPrice.toString();
              return FormBuilderCheckboxGroup(
                name: 'carts',
                options: [
                  FormBuilderFieldOption(
                    value: controller.carts[index],
                    child: BasicCartList(
                      imageUrl: imageUrl,
                      name: name,
                      total: total,
                    ),
                  ),
                ],
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  if (value != null) {
                    if (value.isNotEmpty) {
                      controller.cartList.add(controller.carts[index]);
                    } else {
                      controller.cartList.removeWhere(
                        (element) => element.id == controller.carts[index].id,
                      );
                    }
                  }
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: Text("Total: Rp. 0"),
            ),
            Expanded(
              flex: 1,
              child: BasicElevatedButtonIcon(
                icon: const Icon(
                  Icons.shopping_cart_checkout_rounded,
                  color: Colors.white,
                ),
                title: 'Checkout',
                onPressed: () => controller.submitCart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
