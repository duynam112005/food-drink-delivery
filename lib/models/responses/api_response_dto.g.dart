// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponseDTO<T> _$ApiResponseDTOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ApiResponseDTO<T>(
  data: fromJsonT(json['data']),
  success: json['success'] as bool,
  meta: json['meta'] == null
      ? null
      : MetaDTO.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseDTOToJson<T>(
  _ApiResponseDTO<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'success': instance.success,
  'meta': instance.meta,
};
