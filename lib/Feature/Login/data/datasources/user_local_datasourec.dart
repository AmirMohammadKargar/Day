import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<bool> get isLogged;
  Future<UserModel> getUser();
  Future<UserModel> getUserDB(email, password);
  Future<void> cacheUser(UserModel userToCache);
}
