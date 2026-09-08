import 'package:freezed_annotation/freezed_annotation.dart';
part 'review_dto.freezed.dart';
part 'review_dto.g.dart';

@freezed
abstract class ReviewDTO with _$ReviewDTO{
  const factory ReviewDTO({
    required String id,
    required int rating,
    required String comment,
    required List<String> tags,
    required List<String> imageUrls,
    required int likeCount,
    required bool isLikedByMe,
    required bool isMine,
    required Map<String, Object?> author,
    required String createdAt,
  }) = _ReviewDTO;

  factory ReviewDTO.fromJson(Map<String, dynamic> json) => _$ReviewDTOFromJson(json);
}
