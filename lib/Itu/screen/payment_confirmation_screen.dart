import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/chapa_service.dart';

class PaymentConfirmationScreen extends StatefulWidget {
  final double amount;
  final String fname;
  final String email;
  final String phoneNumber;
  final String paymentUrl;
  final String transactionId;
  final double walletBalance;

  const PaymentConfirmationScreen({
    super.key,
    required this.amount,
    required this.fname,
    required this.email,
    required this.phoneNumber,
    required this.paymentUrl,
    required this.transactionId,
    required this.walletBalance,
  });

  @override
  _PaymentConfirmationScreenState createState() =>
      _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {
  bool _isLoading = false;
  final ChapaService _chapaService = ChapaService(); // Initialize the ChapaService

  // Method to launch the payment URL
  Future<void> _launchPaymentUrl() async {
    final Uri url = Uri.parse(widget.paymentUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      // After user completes payment, verify it
      _verifyPayment(widget.transactionId);
    } else {
      print('Could not launch ${widget.paymentUrl}');
      throw 'Could not launch ${widget.paymentUrl}';
    }
  }

  // Method to verify the payment status using ChapaService
  Future<void> _verifyPayment(String transactionId) async {
    setState(() {
      _isLoading = true; // Show loading indicator during verification
    });

    try {
      final verificationResult = await _chapaService.verifyPayment(transactionId);
      if (verificationResult['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment verified successfully!')),
        );
        // Perform any updates like updating wallet balance or transaction records
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment verification failed!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error verifying payment: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator after verification
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Payment Information', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            Text('Amount: ${widget.amount} ETB', style: const TextStyle(fontSize: 16)),
            Text('First Name: ${widget.fname}', style: const TextStyle(fontSize: 16)),
            Text('Email: ${widget.email}', style: const TextStyle(fontSize: 16)),
            Text('Phone Number: ${widget.phoneNumber}', style: const TextStyle(fontSize: 16)),
            Text('Transaction ID: ${widget.transactionId}', style: const TextStyle(fontSize: 16)),
            Text('Updated Wallet Balance: ${widget.walletBalance} ETB',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            if (_isLoading)
              const Center(child: CircularProgressIndicator()) // Show loading indicator
            else
              ElevatedButton(
                onPressed: _launchPaymentUrl, // Launch payment URL and verify
                child: const Text('Go to payment URL to pay on Chapa'),
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

// class PaymentConfirmationScreen extends StatelessWidget {
//   final double amount;
//   final String fname;
//   final String email;
//   final String phoneNumber;
//   final String paymentUrl;
//   final String transactionId;
//   final double walletBalance;

//   const PaymentConfirmationScreen({
//     super.key,
//     required this.amount,
//     required this.fname,
//     required this.email,
//     required this.phoneNumber,
//     required this.paymentUrl,
//     required this.transactionId,
//     required this.walletBalance,
//   });

//   Future<void> _launchPaymentUrl() async {
//     final Uri url =
//         Uri.parse(paymentUrl); // Convert the paymentUrl string to Uri
//     // Check if the URL can be launched
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url); // Launch the URL
//     } else {
//       // Show an error message if the URL cannot be launched
//       print('Could not launch $paymentUrl');
//       throw 'Could not launch $paymentUrl';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Payment Confirmation')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text('Payment Successful',
//                 style: Theme.of(context).textTheme.titleLarge),
//             const SizedBox(height: 20),
//             Text('Amount: $amount ETB', style: const TextStyle(fontSize: 16)),
//             Text('First Name:$fname',style: const TextStyle(fontSize: 16)),
//             Text('Email: $email', style: const TextStyle(fontSize: 16)),
//             Text('Phone Number: $phoneNumber',
//                 style: const TextStyle(fontSize: 16)),
//             Text('Transaction ID: $transactionId',
//                 style: const TextStyle(fontSize: 16)),
//             Text('Updated Wallet Balance: $walletBalance ETB',
//                 style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight:
//                         FontWeight.bold)), // Display updated wallet balance
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _launchPaymentUrl, // Redirect to the payment URL
//               child: const Text('Go to payment Url to pay on chapa'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Back to Home'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
