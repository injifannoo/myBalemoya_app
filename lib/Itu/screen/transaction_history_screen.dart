import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      'amount': 50.0,
      'date': DateTime(2024, 8, 17),
      'transactionId': 'TXN001',
    },
    {
      'amount': 100.0,
      'date': DateTime(2024, 8, 18),
      'transactionId': 'TXN002',
    },
  ];

   TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text('Amount: ${transaction['amount']} ETB'),
            subtitle: Text('Date: ${transaction['date']}'),
            trailing: Text('Transaction ID: ${transaction['transactionId']}'),
            onTap: () {
              // Optionally, navigate to a detailed view of the transaction
            },
          );
        },
      ),
    );
  }
}
