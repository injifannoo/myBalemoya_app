// lib/models/transaction.dart

enum TransactionType { deposit, withdrawal, commission }

class Transaction {
  final String id;
  final TransactionType type;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
  });

  // Method to get a human-readable string for the transaction type
  String getTransactionTypeString() {
    switch (type) {
      case TransactionType.deposit:
        return 'Deposit';
      case TransactionType.withdrawal:
        return 'Withdrawal';
      case TransactionType.commission:
        return 'Commission';
      default:
        return 'Unknown';
    }
  }
}
