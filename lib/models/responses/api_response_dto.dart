import 'package:food_drink_delivery/models/dto/auth/auth_results/auth_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_response_dto.g.dart';
part 'api_response_dto.freezed.dart';

@freezed
abstract class ApiResponseDTO with _$ApiResponseDTO{
  const factory ApiResponseDTO({
    required AuthDTO data,
    required bool success,
  }) = _ApiResponseDTO;

  factory ApiResponseDTO.fromJson(Map<String, dynamic> json) => _$ApiResponseDTOFromJson(json);
}