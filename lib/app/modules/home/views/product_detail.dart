import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/basic_icon_button.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    required this.productId,
    super.key,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: basicIconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            'https://picsum.photos/seed/picsum/200/300',
            fit: BoxFit.fill,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.3),
          child: const SizedBox(),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Text('Product Detail $productId'),
            ),
            Container(),
            Container(),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.symmetric(vertical: 10),
      //   decoration: BoxDecoration(
      //     border: Border.all(color: Colors.grey),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Container(
      //         child: Text('Button Counter'),
      //       ),
      //       Container(
      //         child: Text('Button Action'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
