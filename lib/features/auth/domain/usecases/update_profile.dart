import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class UpdateProfile {
  final AuthRepository repository;

  UpdateProfile(this.repository);

  Future<User> execute(String name) {
    return repository.updateProfile(name);
  }
}
