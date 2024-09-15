// // auth_service.dart
// import 'mock_data.dart';

// class AuthService {
//   static Future<Map<String, dynamic>> signUp({
//     required String name,
//     required String email,
//     required String phone,
//     required String profession,
//     required String password,
//   }) async {
//     // Use mock data to simulate sign-up
//     return await MockData.addUser(
//       name: name,
//       email: email,
//       phone: phone,
//       profession: profession,
//       password: password,
//     );
//   }

//   static Future<Map<String, dynamic>> login({
//     required String email,
//     required String password,
//   }) async {
//     // Use mock data to simulate login
//     return await MockData.loginUser(
//       email: email,
//       password: password,
//     );
//   }
// }
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String baseUrl =
      'http://192.168.25.151:3000'; // replace '192.168.25.151' this with your by runnin ipconfig in your command

  static Future<Map<String, dynamic>> signUp({
    required String name,
    required String email,
    required String phone,
    required String profession,
    required String password,
  }) async {
    const String url = '$baseUrl/signup';

    final Map<String, String> body = {
      'name': name,
      'email': email,
      'phone': phone,
      'profession': profession,
      'password': password,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'success': false, 'message': 'Sign-up failed'};
    }
  }

  static Future<Map<String, dynamic>> loginUser({
    required String phone,
    required String password,
  }) async {
    const String url = '$baseUrl/login';

    final Map<String, String> body = {
      'phone': phone,
      'password': password,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'success': false, 'message': 'Login failed'};
    }
  }
}
