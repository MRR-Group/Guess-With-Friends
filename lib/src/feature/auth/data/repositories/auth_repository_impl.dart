import 'package:guess_with_friends/src/feature/auth/data/data_source/auth_data_source.dart';
import 'package:guess_with_friends/src/feature/auth/data/exceptions/auth_exception.dart';
import 'package:guess_with_friends/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource api;

  AuthRepositoryImpl(this.api);

  @override
  Future<void> login(String email, String password) async {
    final response = await api.login(email, password);

    if (response) {
      final token = response['token'];
      await _saveToken(token);
    } else {
      throw AuthException(response['message'] ?? 'Login failed');
    }
  }

  @override
  Future<String> register(String email, String name, String password) async {
    final response = await api.register(email, name, password);

    if (response.containsValue('success')) {
      return response['message'];
    } else {
      throw AuthException(response['message'] ?? 'Registration failed');
    }
  }

  @override
  Future<void> sendResetToken(String email) async {
    api.sendResetToken(email);
  }

  @override
  void resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) {
    api.resetPassword(
      email: email,
      token: token,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }

  @override
  Future<void> logout() async {
    api.logout();
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  @override
  Future<void> setPassword({
    required String password,
    required String passwordConfirmation,
  }) async {
    return api.setPassword(
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}