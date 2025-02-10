
class ConversionRate {
  final int megoCoins;
  final int amount;

  ConversionRate({
    required this.megoCoins,
    required this.amount,
  });

  // Convert Firebase document to ConversionRate object
  factory ConversionRate.fromFirestore(Map<String, dynamic> data) {
    return ConversionRate(
      megoCoins: data['megoCoins'] ?? 0,
      amount: data['amount'] ?? 0,
    );
  }

  // Convert ConversionRate object to Firebase document
  Map<String, dynamic> toMap() {
    return {
      'megoCoins': megoCoins,
      'amount': amount,
    };
  }
}
