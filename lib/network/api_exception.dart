import 'package:dio/dio.dart';

class ApiException implements Exception{
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

class ApiExceptionMapper {
  ApiException map(DioException e){
    final message = e.response?.data?['error']?['message'];
    if(message is String){
      return ApiException(message);
    }

    switch(e.type){
      case DioExceptionType.connectionTimeout:
      return ApiException('Connection timeout');
      case DioExceptionType.unknown:
      return ApiException('Unknown error');
      default:
      return ApiException('Something went wrong');
    }
  }
}