import 'package:food_drink_delivery/models/entities/auth/login/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_entity.freezed.dart';
part 'login_entity.g.dart';

@freezed
abstract class LoginEntity with _$LoginEntity {
  factory LoginEntity({
    required UserEntity user,
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required int expiresIn,
  }) = _LoginEntity;

  factory LoginEntity.fromJson(Map<String, Object?> json) =>
      _$LoginEntityFromJson(json);
}
