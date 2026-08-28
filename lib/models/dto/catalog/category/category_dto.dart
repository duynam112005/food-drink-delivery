import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
abstract class CategoryDTO with _$CategoryDTO{
  const factory CategoryDTO({
    required String id,
    required String name,
    required String slug,
    required String iconUrl
  }) = _CategoryDTO;

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);
}