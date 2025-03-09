import 'package:isar/isar.dart';
import 'package:appwrite/models.dart' as appwrite;
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final Isar isar;

  AuthRepositoryImpl(this.remoteDataSource, this.isar);

  @override
  Future<User> register(String email, String password, String name) async {
    final appwrite.User user =
        await remoteDataSource.register(email, password, name);
    final userModel = UserModel.fromAppwriteUser(user);
    await isar.writeTxn(() async {
      await isar.userModels.clear();
      await isar.userModels.put(userModel);
    });
    return userModel.toEntity();
  }

  @override
  Future<User> login(String email, String password) async {
    final appwrite.Session session =
        await remoteDataSource.login(email, password);
    final appwrite.User user = await remoteDataSource.getUser();
    final userModel = UserModel.fromAppwriteUser(user);
    await isar.writeTxn(() async {
      await isar.userModels.clear();
      await isar.userModels.put(userModel);
    });
    return userModel.toEntity();
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
    await isar.writeTxn(() async {
      await isar.userModels.clear();
    });
  }

  @override
  Future<User> authenticateAnonymous() async {
    final appwrite.Session session =
        await remoteDataSource.authenticateAnonymous();
    final appwrite.User user = await remoteDataSource.getUser();
    final userModel = UserModel.fromAppwriteUser(user);
    await isar.writeTxn(() async {
      await isar.userModels.clear();
      await isar.userModels.put(userModel);
    });
    return userModel.toEntity();
  }

  @override
  Future<User> updateProfile(String name) async {
    final appwrite.User user = await remoteDataSource.updateProfile(name);
    final userModel = UserModel.fromAppwriteUser(user);
    await isar.writeTxn(() async {
      await isar.userModels.put(userModel);
    });
    return userModel.toEntity();
  }

  @override
  Future<void> resetPassword(String email) {
    return remoteDataSource.resetPassword(email);
  }

  @override
  Future<String> getCurrentUserId() async {
    try {
      final user = await remoteDataSource.getUser();
      return user.$id;
    } catch (e) {
      throw Exception('Failed to get current user ID: ${e.toString()}');
    }
  }
}
