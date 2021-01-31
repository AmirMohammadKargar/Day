import 'package:Day/Feature/Login/domain/entities/user.dart';

import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<bool> get isLogged;
  Future<UserModel> getUser();
  Future<UserModel> getUserDB(email, password);
  Future<void> cacheUser(UserModel userToCache);
  Future<User> setUser(email, password, name, lastName);
}
