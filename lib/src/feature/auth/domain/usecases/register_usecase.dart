import 'package:guess_with_friends/src/feature/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<String> execute(String email, String name, String password) {
    return repository.register(email, name, password);
  }
}