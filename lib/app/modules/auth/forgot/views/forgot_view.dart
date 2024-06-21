import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgotView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgotView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
