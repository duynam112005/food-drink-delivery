import 'package:food_drink_delivery/models/entities/auth/user/user_entity.dart';

class AuthEntity{
  final UserEntity user;
  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;
  final int? expiresIn;

  AuthEntity({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
  });
}