import 'package:Day/Feature/Login/domain/entities/user.dart';

import 'package:Day/Feature/Login/domain/repository/user_repository.dart';
import 'package:Day/Feature/Login/domain/usecases/get_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  GetUser usecase;
  MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = GetUser(mockUserRepository);
  });

  final email = "test@email.com";
  final password = "123";
  final tUser = User(email: "test@email.com", password: '123');

  test(
    'should get user for the email and password from the repository',
    () async {
      when(mockUserRepository.getUser(any, any))
          .thenAnswer((_) async => Right(tUser));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase.execute(email: email, password: password);
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tUser));
      // Verify that the method has been called on the Repository
      verify(mockUserRepository.getUser(email, password));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockUserRepository);
    },
  );
}
