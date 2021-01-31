import 'package:Day/Feature/Login/data/datasources/user_local_datasourec.dart';
import 'package:Day/Feature/Login/data/models/user_model.dart';
import 'package:Day/core/error/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserModel>> getUser(
      String email, String password) async {
    if (await localDataSource.isLogged) {
      try {
        final user = await localDataSource.getUser();
        return Right(user);
      } on CacheException {
        return Left(CacheFailure());
      }
    } else {
      try {
        final user = await localDataSource.getUserDB(email, password);
        localDataSource.cacheUser(user);
        return Right(user);
      } on DbException {
        return Left(DbFailure());
      }
    }
  }

  @override
  Future<Either<Failure, User>> setUser(
      String email, String password, String name, String lastName) async {
    try {
      final register =
          await localDataSource.setUser(email, password, name, lastName);
      return Right(register);
    } on DbException {
      return Left(DbFailure());
    }
  }
}
