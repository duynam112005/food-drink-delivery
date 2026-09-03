import 'package:freezed_annotation/freezed_annotation.dart';
part 'rating_summary_dto.freezed.dart';
part 'rating_summary_dto.g.dart';

@freezed
abstract class RatingSummaryDTO with _$RatingSummaryDTO{
  const factory RatingSummaryDTO({
    required double? average,
    required int? total,
    required Map<String, int>? distribution
  })= _RatingSummaryDTO;

  factory RatingSummaryDTO.fromJson(Map<String, dynamic> json) => _$RatingSummaryDTOFromJson(json);
}