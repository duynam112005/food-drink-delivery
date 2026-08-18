import 'package:dio/dio.dart';
import 'package:food_drink_delivery/local_data/secure_storage.dart';

class ApiInterceptor extends Interceptor{
  SecureStorage secureStorage = SecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    final token = await secureStorage.read('accessToken');
    //options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  void onResponse(Response response, ResponseInterceptorHandler handler){
    handler.next(response);
  }

  void onError(DioException err, ErrorInterceptorHandler handler){
    handler.next(err);
  }
}