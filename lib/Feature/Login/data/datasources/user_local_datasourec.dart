import 'package:Day/Feature/Login/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<bool> get isLogged;
  Future<UserModel> getUser();
  Future<UserModel> getUserDB(email, password);
  Future<void> cacheUser(UserModel userToCache);
  Future<User> setUser(email, password, name, lastName);
}

class UserLocalDataSourceImp implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImp({@required this.sharedPreferences});

  @override
  Future<void> cacheUser(UserModel userToCache) {
    // TODO: implement cacheUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUser() async {
    final user = sharedPreferences.getStringList("USER");
    UserModel userModel = UserModel(
        email: user[0], password: user[1], name: user[2], lastName: user[3]);
    return userModel;
  }

  @override
  Future<UserModel> getUserDB(email, password) {
    // TODO: implement getUserDB
    throw UnimplementedError();
  }

  @override
  // TODO: implement isLogged
  Future<bool> get isLogged async {
    final result = sharedPreferences.getBool("ISLOGGED");
    return result;
  }

  @override
  Future<User> setUser(email, password, name, lastName) {
    // TODO: implement setUser
    throw UnimplementedError();
  }
}
