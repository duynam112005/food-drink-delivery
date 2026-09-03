class RatingSummaryEntity{
  final double? average;
  final int? total;
  final Map<String, int>? distribution;

  RatingSummaryEntity({
    this.average,
    this.total,
    this.distribution
  });
}