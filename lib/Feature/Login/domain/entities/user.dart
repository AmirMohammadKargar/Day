import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String email;
  final String password;
  final String name;
  final String lastName;
  User({
    @required this.email,
    @required this.password,
    @required this.name,
    @required this.lastName,
  }) : super([email, password, name, lastName]);
}
