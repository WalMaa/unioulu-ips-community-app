import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as appwrite;

class AuthRemoteDataSource {
  final Account account;

  AuthRemoteDataSource(this.account);

  Future<appwrite.User> register(
      String email, String password, String name) async {
    return await account.create(
        email: email, password: password, userId: ID.unique(), name: name);
  }

  Future<appwrite.Session> login(String email, String password) async {
    return await account.createEmailPasswordSession(
        email: email, password: password);
  }

  Future<void> logout() async {
    return await account.deleteSession(sessionId: 'current');
  }

  Future<appwrite.Session> authenticateAnonymous() async {
    return await account.createAnonymousSession();
  }

  Future<appwrite.User> updateProfile(String name) async {
    return await account.updateName(name: name);
  }

//TODO: Implement the resetPassword method
  Future<appwrite.Token> resetPassword(String email) async {
    return await account.createRecovery(
        email: email, url: 'https://example.com');
  }

  Future<appwrite.User> getUser() async {
    return await account.get();
  }
}
