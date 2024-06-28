import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:pos_app/app/models/login_response_model.dart';
import 'package:pos_app/app/routes/app_pages.dart';

GetStorage storage = GetStorage();
String getInitialScreen() {
  final isLogin = storage.read('isLogin');
  if (isLogin == true) {
    String? userJson = storage.read('user');
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      DataLoginResponse user = DataLoginResponse.fromJson(userMap);
      return user.role == 'ADMIN' ? Routes.ADMIN : Routes.HOME;
    }
  }
  return Routes.LOGIN;
}
