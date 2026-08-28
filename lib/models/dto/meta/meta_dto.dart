import 'package:freezed_annotation/freezed_annotation.dart';
part 'meta_dto.freezed.dart';
part 'meta_dto.g.dart';

@freezed
abstract class MetaDTO with _$MetaDTO{
  const factory MetaDTO({
    required int? page,
    required int? limit,
    required int? total,
    required int? totalPages,
    required bool? hasNextPage
  })=_MetaDTO;

  factory MetaDTO.fromJson(Map<String, dynamic> json) => _$MetaDTOFromJson(json);
}