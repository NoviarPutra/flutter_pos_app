import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/expired_controller.dart';

class ExpiredView extends GetView<ExpiredController> {
  const ExpiredView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          controller.title.value,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
