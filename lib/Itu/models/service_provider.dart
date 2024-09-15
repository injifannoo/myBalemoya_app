// lib/models/service_provider.dart

import 'transaction.dart';

class ServiceProvider {
  final String id;
  final String name;
  final String email;
  double walletBalance;
  List<Transaction> transactions;

  ServiceProvider({
    required this.id,
    required this.name,
    required this.email,
    this.walletBalance = 0.0,
    List<Transaction>? transactions,
  }) : transactions = transactions ?? [];

  // Method to deposit funds into the wallet
  void deposit(double amount) {
    walletBalance += amount;
    transactions.add(Transaction(
      id: 'tx_${DateTime.now().millisecondsSinceEpoch}',
      type: TransactionType.deposit,
      amount: amount,
      date: DateTime.now(),
    ));
  }

  // Method to withdraw funds from the wallet
  void withdraw(double amount) {
    if (walletBalance >= amount) {
      walletBalance -= amount;
      transactions.add(Transaction(
        id: 'tx_${DateTime.now().millisecondsSinceEpoch}',
        type: TransactionType.withdrawal,
        amount: amount,
        date: DateTime.now(),
      ));
    } else {
      throw Exception('Insufficient balance to withdraw');
    }
  }

  // Method to deduct commission from the wallet
  void deductCommission(double amount) {
    if (walletBalance > 500) {
      walletBalance -= amount;
      transactions.add(Transaction(
        id: 'tx_${DateTime.now().millisecondsSinceEpoch}',
        type: TransactionType.commission,
        amount: amount,
        date: DateTime.now(),
      ));
    } else {
      throw Exception(
          'Balance must be greater than 500 ETB to deduct commission');
    }
  }

  // Check if the wallet has the minimum balance
  bool hasMinimumBalance() {
    return walletBalance >= 500;
  }
}
