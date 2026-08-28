import 'package:food_drink_delivery/models/dto/meta/meta_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_response_dto.g.dart';
part 'api_response_dto.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class ApiResponseDTO<T> with _$ApiResponseDTO<T>{
  const factory ApiResponseDTO({
    required T data,
    required bool success,
    MetaDTO? meta,
  }) = _ApiResponseDTO<T>;

  //factory ApiResponseDTO.fromJson(Map<String, dynamic> json) => _$ApiResponseDTOFromJson(json);
  factory ApiResponseDTO.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ApiResponseDTOFromJson(json, fromJsonT);
}