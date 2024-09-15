// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_balemoya_app/Itu/services/chapa_service.dart';
import 'package:my_balemoya_app/Itu/services/wallet_service.dart'; // Import the wallet service
import 'payment_confirmation_screen.dart'; // Import the confirmation screen

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final ChapaService _chapaService = ChapaService();
  final WalletService _walletService =
      WalletService(); // Initialize wallet service
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isLoading = false;
  double _walletBalance = 0;

  Timer? _debounce;
  Future<void> _fetchWallet(String email) async {
    if (email.isNotEmpty && email.contains('@') && email.contains('.')) {
      setState(() {
        _isLoading = true;
      });
      try {
        final email = _emailController.text;
        print('Fetching wallet for email: $email');

        final walletData = await _chapaService.getUserWallet(email);
        print('Fetched wallet data: $walletData');

        setState(() {
          _walletBalance = walletData['walletBalance'];
        });
        print('Wallet data: $_walletBalance');
      } catch (e) {
        print('Error fetching wallet in PS: $e');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching wallet: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _onEmailChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Call fetch wallet after the user stops typing for 500ms
      _fetchWallet(value);
    });
  }

  Future<void> _initiatePayment() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final amount = double.parse(_amountController.text);
      final fname = _nameController.text;
      final email = _emailController.text;
      final phoneNumber = _phoneController.text;
      const description = 'Payment Description';

      // Step 1: Initiate the payment with Chapa
      final response = await _chapaService.createPayment(
        amount: amount,
        fname: fname,
        email: email,
        phoneNumber: phoneNumber,
        description: description, 
        lname: '',
        
      );
      
      print('Response body in PS: $response');

      if (response['status'] == 'success') {
        final paymentUrl = response['data']['checkout_url'] as String;
        final data = response['data'] as Map<String, dynamic>;
            final transactionId = data.containsKey('tx_ref') ? data['tx_ref'] as String : 'Unknown';

        // Optionally, refresh wallet balance after successful payment
        await _fetchWallet(email);

        print('Payment URL: $paymentUrl');
        print('Txn id: $transactionId');

        // Step 2: Update the wallet balance after payment
        _walletService.deposit(amount); // Deposit the amount to the wallet
        _walletService.deductCommission(); // Deduct commission if applicable
        _chapaService.createPayment(
            fname: fname,
            amount: amount,
            email: email,
            phoneNumber: phoneNumber,
            description: description, 
            lname: '');

        // Step 3: Navigate to the payment confirmation screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentConfirmationScreen(
              amount: amount,
              fname: fname,
              email: email,
              phoneNumber: phoneNumber,
              paymentUrl: paymentUrl,
              transactionId: transactionId,
              walletBalance: _walletBalance,
            ),
          ),
        );
      } else {
        throw Exception('Payment initiation failed');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Payment Screen')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//                 'Wallet Balance: ${_walletService.balance} ETB', // Display wallet balance
//                 style: Theme.of(context).textTheme.titleLarge),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _amountController,
//               decoration: const InputDecoration(
//                 labelText: 'Amount',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.attach_money),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.email),
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _phoneController,
//               decoration: const InputDecoration(
//                 labelText: 'Phone Number',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.phone),
//               ),
//               keyboardType: TextInputType.phone,
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton.icon(
//               onPressed: _initiatePayment,
//               icon: const Icon(Icons.payment),
//               label: const Text('Pay Now'),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 textStyle: const TextStyle(fontSize: 18),
//               ),
//             ),
//             const SizedBox(height: 20),
//             if (_isLoading) const CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Payment Screen')),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Wallet Balance: $_walletBalance ETB',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: _initiatePayment,
                  icon: const Icon(Icons.payment),
                  label: const Text('Deposit to Wallet'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                if (_isLoading) const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

}
