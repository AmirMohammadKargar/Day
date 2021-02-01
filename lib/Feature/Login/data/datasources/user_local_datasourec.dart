import 'package:Day/Feature/Login/domain/entities/user.dart';
import 'package:Day/core/database/day_database.dart';
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
  final AppDatabase db;
  UserLocalDataSourceImp({@required this.sharedPreferences, @required this.db});

  @override
  Future<void> cacheUser(UserModel userToCache) async {
    sharedPreferences.setBool("ISLOGGED", true);
    List<String> user = [
      userToCache.email,
      userToCache.password,
      userToCache.name,
      userToCache.lastName
    ];
    sharedPreferences.setStringList("USER", user);
  }

  @override
  Future<UserModel> getUser() async {
    final user = sharedPreferences.getStringList("USER");
    UserModel userModel = UserModel(
        email: user[0], password: user[1], name: user[2], lastName: user[3]);
    return userModel;
  }

  @override
  Future<UserModel> getUserDB(email, password) async {
    List<TabelUser> users = await db.getAllTasks();
    for (int i = 0; i < users.length; i++) {
      if (users[i].email == email && users[i].password == password) {
        return UserModel(
            email: email,
            password: password,
            name: users[i].name,
            lastName: users[i].lastName);
      }
    }
    return null;
  }

  @override
  Future<bool> get isLogged async {
    final result = sharedPreferences.getBool("ISLOGGED");
    return result;
  }

  @override
  Future<UserModel> setUser(email, password, name, lastName) async {
    TabelUser user = TabelUser(
        email: email, password: password, name: name, lastName: lastName);
    UserModel userMdoel = UserModel(
        email: email, password: password, name: name, lastName: lastName);
    db.insertUser(user);
    return userMdoel;
  }
}
