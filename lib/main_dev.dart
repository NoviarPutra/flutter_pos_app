import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos_app/utils/check_expired_token.dart';
import 'package:pos_app/utils/initial_screen.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await GetStorage.init();

  FlavorConfig(
    name: 'Pos App Dev',
    variables: {
      'baseUrl': dotenv.env['BASE_URL_DEV'],
    },
  );

  isTokenExpired();
  String initial = getInitialScreen();
  runApp(
    GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: "Application",
        debugShowCheckedModeBanner: false,
        initialRoute: initial,
        getPages: AppPages.routes,
        theme: ThemeData(fontFamily: 'Lato'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('id', 'ID'),
        ],
        builder: EasyLoading.init(),
      ),
    ),
  );
}
