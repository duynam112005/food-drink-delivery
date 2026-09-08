class ReviewEntity {
  final String id;
  final int rating;
  final String comment;
  final List<String> tags;
  final List<String> imageUrls;
  final int likeCount;
  final bool isLikedByMe;
  final bool isMine;
  final Map<String, Object?> author;
  final String createdAt;

  ReviewEntity({
    required this.id,
    required this.rating,
    required this.comment,
    required this.tags,
    required this.imageUrls,
    required this.likeCount,
    required this.isLikedByMe,
    required this.isMine,
    required this.author,
    required this.createdAt,
  });
}