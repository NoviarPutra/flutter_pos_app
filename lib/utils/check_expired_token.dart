import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

Future<void> isTokenExpired() async {
  GetStorage storage = GetStorage();
  String token = storage.read('token');
  String secretKey = dotenv.env['JWT_SECRET_KEY']!;

  try {
    final jwt = JWT.verify(token, SecretKey(secretKey));
    debugPrint("Payload:$jwt");
  } on JWTExpiredException {
    debugPrint('jwt expired');
    storage.write('isExpired', true);
  } on JWTException catch (ex) {
    debugPrint(ex.message);
  }
}
