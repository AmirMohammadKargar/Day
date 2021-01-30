import 'package:Day/Feature/Login/domain/entities/user.dart';
import 'package:Day/core/error/failures.dart';
import 'package:Day/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../repository/user_repository.dart';

class SetUser extends UseCase<User, Params> {
  final UserRepository repository;

  SetUser(this.repository);
  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.setUser(
        params.email, params.password, params.name, params.lastName);
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  final String name;
  final String lastName;
  Params({
    @required this.name,
    @required this.lastName,
    @required this.email,
    @required this.password,
  }) : super([email, password]);
}
