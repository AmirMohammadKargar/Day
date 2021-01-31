import 'package:meta/meta.dart';

import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    @required String email,
    @required String password,
    @required String name,
    @required String lastName,
  }) : super(email: email, password: password, name: name, lastName: lastName);
}
