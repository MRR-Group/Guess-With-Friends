
import 'package:guess_with_friends/src/core/network/network_service.dart';
import 'package:guess_with_friends/src/feature/auth/data/exceptions/error_response.dart';
import 'package:guess_with_friends/src/feature/auth/data/models/login_response.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(String email, String password);
  Future<void> register(String email, String name, String password);
  Future<void> sendResetToken(String email);
  Future<void> logout();

  void resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  });

  Future<void> setPassword({
    required String password,
    required String passwordConfirmation,
  });
}

class AuthDataSourceDataSourceImpl  extends AuthDataSource {
  final NetworkService networkService;

  AuthDataSourceDataSourceImpl(this.networkService);

  Future<LoginResponse> login(
      String email,
      String password,
  ) async {

    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    var response = await networkService.postRequest(
      urlPath: 'api/auth/login',
      body: body,
    );

    return LoginResponse.fromJson(response);
  }

  Future<void> register(
      String email,
      String name,
      String password,
      ) async {

    final Map<String, String> body = {
      'email': email,
      'name': name,
      'password': password,
    };

    await networkService.postRequest(
      urlPath: 'api/auth/register',
      body: body,
    );
  }

  Future<void> sendResetToken(String email) async {
    final Map<String, String> body = {
      'email': email,
    };

    await networkService.postRequest(
      urlPath: 'api/auth/forgot-password',
      body: body,
    );
  }

  Future<void> resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) async {
    final Map<String, String> body = {
      'email': email,
      'token': token,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };

    await networkService.postRequest(
      urlPath: 'api/auth/reset-password',
      body: body,
    );
  }

  Future<void> setPassword({
    required String password,
    required String passwordConfirmation,
  }) async {
    final Map<String, String> body = {
      'password': password,
      'password_confirmation': passwordConfirmation,
    };

    await networkService.postRequest(
      urlPath: 'api/user/set-password',
      body: body,
    );
  }

  Future<void> logout() async {
    await networkService.postRequest(
      urlPath: 'api/auth/logout',
    );
  }
}