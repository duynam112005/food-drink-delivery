import 'package:food_drink_delivery/models/dto/catalog/restaurant/review_dto.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/review_entity.dart';

class ReviewMapper{
  static ReviewEntity toEntity(ReviewDTO dto){
    return ReviewEntity(
      id: dto.id,
      rating: dto.rating,
      comment: dto.comment,
      tags: dto.tags,
      imageUrls: dto.imageUrls,
      likeCount: dto.likeCount,
      isLikedByMe: dto.isLikedByMe,
      isMine: dto.isMine,
      author: dto.author,
      createdAt: dto.createdAt,
    );
  }
}