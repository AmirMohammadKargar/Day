import '../../../../../lib/Feature/Login/data/models/user_model.dart';
import '../../../../../lib/Feature/Login/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tUser = UserModel(
      email: "email@test.com",
      password: '123',
      name: "Amir",
      lastName: "Kargar");
  group('model', () {
    test(
      'should be a subclass of User entity',
      () async {
        // assert
        expect(tUser, isA<User>());
      },
    );
  });
}
