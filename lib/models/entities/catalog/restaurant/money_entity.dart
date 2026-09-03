class MoneyEntity{
  final int? amount;
  final String currency;
  final String formatted;

  MoneyEntity({
    this.amount,
    required this.currency,
    required this.formatted
  });
}