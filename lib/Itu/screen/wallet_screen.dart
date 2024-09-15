import 'package:flutter/material.dart';
import 'package:my_balemoya_app/Itu/screen/payment_screen.dart';
import 'package:my_balemoya_app/Itu/services/chapa_service.dart';
import 'package:my_balemoya_app/Itu/services/wallet_service.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final ChapaService _chapaService = ChapaService();
  final WalletService _walletService = WalletService();
  double _walletBalance = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchWalletBalance();
  }

  Future<void> _fetchWalletBalance() async {
    setState(() {
      _isLoading = true;
    });

    try {
      const email = 'itu1@gmail.com'; // Replace with the actual user's email
      final walletData = await _chapaService.getUserWallet(email);
      setState(() {
        _walletBalance = walletData['walletBalance'];
      });
    } catch (e) {
      print('Error fetching wallet n WL: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching wallet: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _navigateToPayment() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const PaymentScreen(), // Navigate to the PaymentScreen
      ),
    ).then((_) {
      _fetchWalletBalance(); // Refresh the wallet balance after returning from the payment screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Wallet Balance: $_walletBalance ETB',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _navigateToPayment,
              icon: const Icon(Icons.payment),
              label: const Text('Deposit to Wallet'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            if (_isLoading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
