import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  ProductDetailController({
    required this.price,
  });

  final int price;

  RxInt priceValue = 0.obs;
  RxInt quantity = 1.obs;

  @override
  void onInit() {
    priceValue.value = price;
    super.onInit();
  }

  void incrementQuantity() {
    quantity.value++;
    priceValue.value = price * quantity.value;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
      priceValue.value = price * quantity.value;
    }
  }
}
