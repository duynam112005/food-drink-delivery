// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponseDTO _$ApiResponseDTOFromJson(Map<String, dynamic> json) =>
    _ApiResponseDTO(
      data: AuthDTO.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool,
    );

Map<String, dynamic> _$ApiResponseDTOToJson(_ApiResponseDTO instance) =>
    <String, dynamic>{'data': instance.data, 'success': instance.success};
