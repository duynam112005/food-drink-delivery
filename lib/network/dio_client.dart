import 'package:dio/dio.dart';
import 'package:food_drink_delivery/network/api_interceptor.dart';

class DioClient {
  late final Dio dio;

  DioClient(){
    dio = Dio(BaseOptions(baseUrl: 'https://cook-api-gkia.onrender.com'));
    dio.interceptors.add(ApiInterceptor());
  }
}