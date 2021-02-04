import 'dart:async';

import 'package:Day/Feature/Login/domain/entities/user.dart';
import 'package:Day/Feature/Login/domain/usecases/get_user.dart';
import 'package:Day/Feature/Login/domain/usecases/set_user.dart';
import 'package:Day/core/error/failures.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'login_event.dart';
part 'login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetUser getUser;
  final SetUser setUser;

  LoginBloc({
    @required GetUser getUsers,
    @required SetUser setUsers,
  })  : assert(getUsers != null),
        assert(setUsers != null),
        getUser = getUsers,
        setUser = setUsers;

  @override
  // TODO: implement initialState
  LoginState get initialState => Empty();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is GetUsers) {
      yield Loading();
      final failureOrUser = await getUser(ParamsOne(
        email: event.email,
        password: event.password,
      ));
      yield failureOrUser.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (user) => Loaded(user: user),
      );
    } else if (event is SetUsers) {
      yield Loading();
      final failureOrUser = await setUser(Params(
        email: event.email,
        password: event.password,
        name: event.name,
        lastName: event.lastName,
      ));
      yield failureOrUser.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (user) => Loaded(user: user),
      );
    }
  }
}

String _mapFailureToMessage(Failure failure) {
  // Instead of a regular 'if (failure is ServerFailure)...'
  switch (failure.runtimeType) {
    case DbFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
