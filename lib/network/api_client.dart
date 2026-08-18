import 'package:dio/dio.dart';
import 'package:food_drink_delivery/models/entities/auth/auth_results/auth_entity.dart';

class ApiClient {
  final Dio dio;
  ApiClient({required this.dio});

  //login with social
  Future<AuthEntity> loginWithSocial(String firebaseIdToken) async {
    final response = await dio.post(
      '/v1/auth/social',
      data: {'firebaseIdToken': firebaseIdToken},
    );
    return AuthEntity.fromJson(response.data['data']);
  }

  //login with email and password
  Future<AuthEntity> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final response = await dio.post(
      '/v1/auth/login',
      data: {'identifier': email, 'password': password},
    );
    return AuthEntity.fromJson(response.data['data']);
  }

  //register
  
}
