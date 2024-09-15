// mock_data.dart
class MockData {
  static List<Map<String, String>> users = [];

  static Future<Map<String, dynamic>> addUser({
    required String name,
    required String email,
    required String phone,
    required String profession,
    required String password,
  }) async {
    // Check if user already exists
    for (var user in users) {
      if (user['email'] == email) {
        return {'success': false, 'message': 'User already exists'};
      }
    }

    // Add user to mock data
    users.add({
      'name': name,
      'email': email,
      'phone': phone,
      'profession': profession,
      'password': password,
    });

    return {'success': true, 'message': 'Sign-up successful'};
  }

  static Future<Map<String, dynamic>> loginUser({
    required String phone,
    required String password,
  }) async {
    // Check if user exists and password matches
    for (var user in users) {
      if (user['phone'] == phone && user['password'] == password) {
        return {'success': true, 'message': 'Login successful'};
      }
    }

    return {'success': false, 'message': 'Invalid email or password'};
  }
}
