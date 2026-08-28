class MetaEntity{
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPages;
  final bool? hasNextPage;

  MetaEntity({
    this.page,
    this.limit,
    this.total,
    this.totalPages,
    this.hasNextPage
  });
}