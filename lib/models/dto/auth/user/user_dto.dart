
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDTO with _$UserDTO{
  const factory UserDTO({
    required String? id,
    required String? fullName,
    required String email,
    required String? phone,
    required String? avatarUrl,
    required bool? emailVerified,
  })= _UserDTO;

  factory UserDTO.fromJson(Map<String, Object?> json) => _$UserDTOFromJson(json);
}