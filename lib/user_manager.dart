// user_manager.dart
import 'user.dart';

class UserManager {
  // In-memory user database
  static List<User> _users = [];

  // Register a new user
  static String register(String username, String password) {
    // Check if the user already exists
    if (_users.any((user) => user.username == username)) {
      return 'User already exists!';
    }

    _users.add(User(username: username, password: password));
    return 'Registration successful!';
  }

  // Login
  static String login(String username, String password) {
    final user = _users.firstWhere(
          (user) => user.username == username,
      orElse: () => User(username: '', password: ''),
    );

    if (user.username.isEmpty) {
      return 'User not found!';
    }

    if (user.password != password) {
      return 'Incorrect password!';
    }

    return 'Login successful!';
  }

  // Forgot password
  static String forgotPassword(String username, String newPassword) {
    final user = _users.firstWhere(
          (user) => user.username == username,
      orElse: () => User(username: '', password: ''),
    );

    if (user.username.isEmpty) {
      return 'User not found!';
    }

    user.password = newPassword;
    return 'Password reset successful!';
  }
}
