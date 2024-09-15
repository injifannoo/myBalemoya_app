// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class ChapaService {
  final String baseUrl = 'https://api.chapa.co/v1'; // Correct base URL
  final String apiKey =
      'CHASECK_TEST-O7n7AHxy8HOXhLwxKUuxpGT7PMPSbgtb'; // Your Chapa API key
  final String backendBaseUrl = 'http://192.168.25.151:3000';

  Future<Map<String, dynamic>> createPayment({
    required String fname,
    required String lname,
    required double amount,
    required String email,
    required String phoneNumber,
    required String description,
  }) async {
    if (fname.isEmpty ||
        email.isEmpty ||
        phoneNumber.isEmpty ||
        description.isEmpty) {
      throw ArgumentError(
          'Email, phoneNumber, and description must not be empty.');
    }

    final String txRef = 'txn${const Uuid().v4().substring(0, 4)}';
    // Generate a unique transaction reference
    print('Txn reference is:$txRef');
    final url =
        Uri.parse('$baseUrl/transaction/initialize'); // Updated endpoint
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'amount': amount,
        'currency': 'ETB',
        'email': email,
        'first_name': fname,
        'last_name': lname,
        'tx_ref': txRef,
        'callback_url':
            '$backendBaseUrl/callback', // Your server's callback URL
        "return_url": "https://www.google.com/",
        'phone': phoneNumber,
        "customization": {
          "title": "Payment",
          'description': description,
        }
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception(
          'Failed to create payment in chapa service:${response.reasonPhrase}');
    }
  }

  Future<Map<String, dynamic>> verifyPayment(String txRef) async {
    final headers = {
      'Authorization': 'Bearer $apiKey',
    };

    final url = Uri.parse('$baseUrl/transaction/verify/$txRef');
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
      print('Verification result: $result');
      return result; // Return the verification result
    } else {
      print('Failed to verify payment. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to verify payment: ${response.reasonPhrase}');
    }
  }

  Future<Map<String, dynamic>> getUserWallet(String email) async {
    final url = Uri.parse('$backendBaseUrl/wallet/$email');
    final response = await http.get(url);
    print('The response ${response.body} and $url from getUserWallet method');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch wallet data');
    }
  }

  Future<Map<String, dynamic>> deductCommission(String email) async {
    final url = Uri.parse('$backendBaseUrl/deduct-commission');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to deduct commission');
    }
  }
}
