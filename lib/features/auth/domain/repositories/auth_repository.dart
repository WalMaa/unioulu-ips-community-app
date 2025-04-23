import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> register(String email, String password, String name);
  Future<User> login(String email, String password);
  Future<void> logout();
  Future<User> authenticateAnonymous();
  Future<User> updateProfile(String name);
  Future<void> resetPassword(String email);
  Future<String> getCurrentUserId();
}
