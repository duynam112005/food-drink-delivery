import 'package:food_drink_delivery/models/dto/auth/user/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

@freezed
abstract class AuthDTO with _$AuthDTO{
  const factory AuthDTO({
    required UserDTO user,
    required String? accessToken,
    required String? refreshToken,
    required String? tokenType,
    required int? expiresIn,
  })= _AuthDTO;

  factory AuthDTO.fromJson(Map<String, Object?> json) => _$AuthDTOFromJson(json);
}