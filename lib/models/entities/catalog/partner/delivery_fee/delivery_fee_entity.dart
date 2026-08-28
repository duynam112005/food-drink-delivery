class DeliveryFeeEntity{
  final int? amount;
  final String currency;
  final String formatted;

  DeliveryFeeEntity({
    this.amount,
    required this.currency,
    required this.formatted
  });
}