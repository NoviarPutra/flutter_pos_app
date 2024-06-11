import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_app/widgets/basic_icon_button.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  get child => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Center(
        child: Text("HistoryView is working", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
