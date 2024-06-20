import 'package:get_storage/get_storage.dart';
import 'package:pos_app/app/routes/app_pages.dart';

GetStorage storage = GetStorage();
String getInitialScreen() {
  return storage.read('isLogin') == true ? Routes.HOME : Routes.LOGIN;
}
