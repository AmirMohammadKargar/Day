part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]) : super(props);
}

class GetUsers extends LoginEvent {
  final String email;
  final String password;

  GetUsers(this.email, this.password) : super([email, password]);
}

class SetUsers extends LoginEvent {
  final String email;
  final String password;
  final String name;
  final String lastName;

  SetUsers(this.email, this.password, this.name, this.lastName)
      : super([email, password, name, lastName]);
}
