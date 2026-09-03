// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingSummaryDTO _$RatingSummaryDTOFromJson(Map<String, dynamic> json) =>
    _RatingSummaryDTO(
      average: (json['average'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toInt(),
      distribution: (json['distribution'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$RatingSummaryDTOToJson(_RatingSummaryDTO instance) =>
    <String, dynamic>{
      'average': instance.average,
      'total': instance.total,
      'distribution': instance.distribution,
    };
