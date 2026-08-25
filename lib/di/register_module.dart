import 'package:dio/dio.dart';
import 'package:food_drink_delivery/network/api_interceptor.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio(){
    final dio = Dio(BaseOptions(baseUrl: 'https://cook-api-gkia.onrender.com'));
    dio.interceptors.add(ApiInterceptor());
    return dio;
  }
}