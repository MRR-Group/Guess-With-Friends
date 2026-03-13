import 'package:guess_with_friends/src/feature/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository repository;

  ResetPasswordUsecase(this.repository);

  Future<void> execute({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) async {
    repository.resetPassword(
      email: email,
      token: token,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}