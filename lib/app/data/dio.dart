// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:pos_app/app/data/interceptor.dart';

class DioInstance {
  DioInstance._internal();
  static final DioInstance instance = DioInstance._internal();
  factory DioInstance() => instance;

  final service = init();

  static Dio init() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: FlavorConfig.instance.variables['baseUrl']!,
      ),
    );

    dio.interceptors.addAll({AppInterceptor(dio)});

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return dio;
  }
}
