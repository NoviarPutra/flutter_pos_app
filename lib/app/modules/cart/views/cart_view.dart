import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pos_app/app/models/cart_response_model.dart';
import 'package:pos_app/app/widgets/basic_cart_list.dart';
import 'package:pos_app/app/widgets/basic_elevated_icon_button.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => controller.cartPaging.refresh()),
        child: FormBuilder(
          key: controller.formKey,
          child: PagedListView<int, DataCartResponse>(
            pagingController: controller.cartPaging,
            builderDelegate: PagedChildBuilderDelegate<DataCartResponse>(
              itemBuilder: (context, item, index) => FormBuilderCheckbox(
                name: item.id.toString(),
                title: BasicCartList(
                  total: item.total.toString(),
                ),
                onChanged: (value) => value!
                    ? controller.cartList.add(item)
                    : controller.cartList
                        .removeWhere((element) => element.id == item.id),
              ),
            ),
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
