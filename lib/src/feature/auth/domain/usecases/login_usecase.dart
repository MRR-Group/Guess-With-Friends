
import 'package:guess_with_friends/src/feature/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> execute(String email, String password) async {
    await repository.login(email, password);
  }
}