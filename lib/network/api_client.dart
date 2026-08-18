import 'package:dio/dio.dart';
import 'package:food_drink_delivery/models/entities/auth/login/login_entity.dart';

class ApiClient {
  final Dio dio;
  ApiClient({required this.dio});

  //login with social
  Future<LoginEntity> loginWithSocial(String firebaseIdToken) async {
    final response = await dio.post(
      '/v1/auth/social',
      data: {'firebaseIdToken': firebaseIdToken},
    );
    return LoginEntity.fromJson(response.data['data']);
  }

  //login with email and password
  Future<LoginEntity> loginWithEmailAndPassword(String email, String password) async{
    final response = await dio.post('/v1/auth/login', data: {
      'email': email,
      'password': password,
    });
    return LoginEntity.fromJson(response.data['data']);
  }
}

