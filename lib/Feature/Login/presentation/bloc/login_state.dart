part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const <dynamic>[]]) : super(props);
}

class LoginInitial extends LoginState {}

class Empty extends LoginState {}

class Loading extends LoginState {}

class Loaded extends LoginState {
  final User user;

  Loaded({@required this.user}) : super([user]);
}

class Error extends LoginState {
  final String message;

  Error({@required this.message}) : super([message]);
}
