import 'package:Day/Feature/Login/domain/entities/user.dart';
import 'package:Day/core/error/failures.dart';
import 'package:Day/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../repository/user_repository.dart';

class GetUser extends UseCase<User, ParamsOne> {
  final UserRepository repository;

  GetUser(this.repository);
  @override
  Future<Either<Failure, User>> call(ParamsOne params) async {
    return await repository.getUser(params.email, params.password);
  }
}

class ParamsOne extends Equatable {
  final String email;
  final String password;

  ParamsOne({
    @required this.email,
    @required this.password,
  }) : super([email, password]);
}
