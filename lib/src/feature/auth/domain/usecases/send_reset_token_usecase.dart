import 'package:guess_with_friends/src/feature/auth/domain/repositories/auth_repository.dart';

class SendResetTokenUsecase {
  final AuthRepository repository;

  SendResetTokenUsecase(this.repository);

  Future<void> execute(String email) async {
    repository.sendResetToken(email);
  }
}