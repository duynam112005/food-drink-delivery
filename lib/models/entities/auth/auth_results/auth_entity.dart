import 'package:food_drink_delivery/models/entities/auth/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_entity.freezed.dart';
part 'auth_entity.g.dart';

@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required UserEntity user,
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required int expiresIn,
  }) = _AuthEntity;

  factory AuthEntity.fromJson(Map<String, Object?> json) =>
      _$AuthEntityFromJson(json);
}
