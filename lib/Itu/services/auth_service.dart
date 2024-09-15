// lib/services/auth_service.dart


class AuthService {
  bool _isAuthenticated = false;
  String? _userId;

  // Mock user data for demonstration
  final List<Map<String, String>> _mockUsers = [
    {'id': '1', 'email': 'john@example.com', 'password': 'password123'},
    {'id': '2', 'email': 'jane@example.com', 'password': 'password456'},
  ];

  // Getter to check if the user is authenticated
  bool get isAuthenticated => _isAuthenticated;

  // Getter to retrieve the authenticated user's ID
  String? get userId => _userId;

  // Method to handle user login
  Future<void> login(String email, String password) async {
    // Simulate a delay for the mock backend
    await Future.delayed(const Duration(seconds: 2));

    // Check if the user exists in the mock user data
    final user = _mockUsers.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => {});

    if (user.isNotEmpty) {
      _isAuthenticated = true;
      _userId = user['id'];
    } else {
      throw Exception('Invalid email or password');
    }
  }

  // Method to handle user registration
  Future<void> register(String email, String password) async {
    // Simulate a delay for the mock backend
    await Future.delayed(const Duration(seconds: 2));

    // Check if the email is already registered
    final existingUser = _mockUsers.any((user) => user['email'] == email);

    if (existingUser) {
      throw Exception('Email is already registered');
    } else {
      final newUser = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'email': email,
        'password': password,
      };
      _mockUsers.add(newUser);
      _isAuthenticated = true;
      _userId = newUser['id'];
    }
  }

  // Method to handle user logout
  Future<void> logout() async {
    // Simulate a delay for the mock backend
    await Future.delayed(const Duration(seconds: 1));
    _isAuthenticated = false;
    _userId = null;
  }
}
