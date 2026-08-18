import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String fullName,
    required String email,
    required String phone,
    required String avatarUrl,
    required bool emailVerified,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) =>
      _$UserEntityFromJson(json);
}
