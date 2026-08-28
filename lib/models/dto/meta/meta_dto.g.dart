// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetaDTO _$MetaDTOFromJson(Map<String, dynamic> json) => _MetaDTO(
  page: (json['page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
  hasNextPage: json['hasNextPage'] as bool?,
);

Map<String, dynamic> _$MetaDTOToJson(_MetaDTO instance) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'total': instance.total,
  'totalPages': instance.totalPages,
  'hasNextPage': instance.hasNextPage,
};
