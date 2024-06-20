import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos_app/utils/initial_screen.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  String initial = getInitialScreen();
  runApp(
    GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: "Application",
        locale: const Locale('id', 'ID'),
        debugShowCheckedModeBanner: false,
        initialRoute: initial,
        getPages: AppPages.routes,
        theme: ThemeData(fontFamily: 'Lato'),
        builder: EasyLoading.init(),
      ),
    ),
  );
}
