import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor{
  final String token = '';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler){
    //options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  void onResponse(Response response, ResponseInterceptorHandler handler){
    handler.next(response);
  }

  void error(DioException err, ErrorInterceptorHandler handler){
    handler.next(err);
  }
}