import 'package:Day/Feature/Login/domain/entities/user.dart';

import 'package:Day/Feature/Login/domain/repository/user_repository.dart';
import 'package:Day/Feature/Login/domain/usecases/set_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  SetUser usecase;
  MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = SetUser(mockUserRepository);
  });

  final email = "test@email.com";
  final password = "123";
  final name = "Amir";
  final lastName = "Kargar";
  final tUser = User(
      email: "test@email.com",
      password: '123',
      name: "Amir",
      lastName: "Kargar");

  test(
    'should set user to database from the repository',
    () async {
      when(mockUserRepository.setUser(any, any, any, any))
          .thenAnswer((_) async => Right(tUser));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(Params(
          email: email, password: password, name: name, lastName: lastName));
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tUser));
      // Verify that the method has been called on the Repository
      verify(mockUserRepository.setUser(email, password, name, lastName));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockUserRepository);
    },
  );
}
