import 'package:Day/Feature/Login/domain/entities/user.dart';
import 'package:Day/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../repository/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);
  Future<Either<Failure, User>> execute({
    @required String email,
    @required String password,
  }) async {
    return await repository.getUser(email, password);
  }
}
