import 'package:pos_app/app/models/register_response_model.dart';

import '../data/dio.dart';
import '../models/login_response_model.dart';

class AuthenticationService {
  static AuthenticationService? _instance;
  factory AuthenticationService() => _instance ??= AuthenticationService._();
  AuthenticationService._();

  Future<LoginResponseModel> login({Map<String, dynamic>? data}) async {
    final service = DioInstance().service;
    final response = await service.post('/authentication/login', data: data);
    return LoginResponseModel.fromJson(response.data);
  }

  Future<RegisterResponseModel> register({Map<String, dynamic>? data}) async {
    final service = DioInstance().service;
    final response = await service.post('/authentication/register', data: data);
    return RegisterResponseModel.fromJson(response.data);
  }
}
