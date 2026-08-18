import 'package:food_drink_delivery/models/entities/auth/social/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'social_entity.freezed.dart';
part 'social_entity.g.dart';

@freezed
abstract class SocialEntity with _$SocialEntity {
  factory SocialEntity({
    required UserEntity user,
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required int expiresIn,
  }) = _SocialEntity;

  factory SocialEntity.fromJson(Map<String, Object?> json) =>
      _$SocialEntityFromJson(json);
}
