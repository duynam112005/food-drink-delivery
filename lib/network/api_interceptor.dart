import 'package:dio/dio.dart';
import 'package:food_drink_delivery/storage/secure_storage.dart';

class ApiInterceptor extends Interceptor{
  SecureStorage secureStorage = SecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    final token = await secureStorage.read('accessToken');
    if(token!=null){
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler){
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler){
    handler.next(err);
  }
}