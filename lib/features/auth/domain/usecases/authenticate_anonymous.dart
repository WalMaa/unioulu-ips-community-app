import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class AuthenticateAnonymous {
  final AuthRepository repository;

  AuthenticateAnonymous(this.repository);

  Future<User> execute() {
    return repository.authenticateAnonymous();
  }
}
