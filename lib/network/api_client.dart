import 'package:dio/dio.dart';
import 'package:food_drink_delivery/models/entities/auth/social/social_entity.dart';

class ApiClient {
  final Dio dio;
  ApiClient({required this.dio});

  // Future<SocialEntity> loginWithSocial(String firebaseIdToken) async {
  //   final response = await dio.post(
  //     '/v1/auth/social',
  //     data: {'firebaseIdToken': firebaseIdToken},
  //   );

  //   final root = _asMap(response.data);
  //   final payload = root['data'] is Map ? _asMap(root['data']) : root;
  //   return SocialEntity.fromJson(payload);
  // }

  // Map<String, dynamic> _asMap(dynamic value) {
  //   if (value is Map<String, dynamic>) {
  //     return value;
  //   }
  //   if (value is Map) {
  //     return Map<String, dynamic>.from(value);
  //   }
  //   throw const FormatException('API response is not a valid JSON object');
  // }

  Future<SocialEntity> loginWithSocial(String firebaseIdToken) async {
    final response = await dio.post(
      '/v1/auth/social',
      data: {'firebaseIdToken': firebaseIdToken},
    );
    return SocialEntity.fromJson(response.data['data']);
  }
}
