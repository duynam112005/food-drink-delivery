import 'package:dio/dio.dart';
import 'package:food_drink_delivery/network/api_interceptor.dart';
import 'package:food_drink_delivery/storage/secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio(SecureStorage secureStorage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://cook-api-gkia.onrender.com',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(
      ApiInterceptor(dio: dio, secureStorage: secureStorage),
    );
    return dio;
  }
}