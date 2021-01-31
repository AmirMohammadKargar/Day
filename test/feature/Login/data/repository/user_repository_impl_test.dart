import 'package:Day/Feature/Login/data/datasources/user_local_datasourec.dart';
import 'package:Day/Feature/Login/data/models/user_model.dart';
import 'package:Day/Feature/Login/data/repository/user_repository_impl.dart';
import 'package:Day/Feature/Login/domain/entities/user.dart';
import 'package:Day/core/error/exception.dart';
import 'package:Day/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLocalDataSource extends Mock implements UserLocalDataSource {}

void main() {
  UserRepositoryImpl repository;
  MockLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    repository = UserRepositoryImpl(localDataSource: mockLocalDataSource);
  });
  void runTestsCache(Function body) {
    group('Get from cahe', () {
      setUp(() {
        when(mockLocalDataSource.isLogged).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsDB(Function body) {
    group('get from DB', () {
      setUp(() {
        when(mockLocalDataSource.isLogged).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getUser', () {
    final email = "test@email.com";
    final password = "123";
    final tUserModel = UserModel(
      email: "test@email.com",
      password: '123',
      name: "Amir",
      lastName: "Kargar",
    );
    final User tUser = tUserModel;
    test(
      'should check if the loggedin is true',
      () async {
        when(mockLocalDataSource.isLogged).thenAnswer((_) async => true);
        repository.getUser(email, password);
        verify(mockLocalDataSource.isLogged);
      },
    );
    runTestsCache(() {
      test('should get user from cache', () async {
        //arrange
        when(mockLocalDataSource.getUser()).thenAnswer((_) async => tUserModel);
        // act
        final result = await repository.getUser(email, password);
        // assert
        verify(mockLocalDataSource.getUser());
        expect(result, equals(Right(tUserModel)));
      });
      test('should throw cache exception.', () async {
        //arrange
        when(mockLocalDataSource.getUser()).thenThrow(CacheException());
        // act
        final result = await repository.getUser(email, password);
        // assert
        verify(mockLocalDataSource.getUser());
        expect(result, equals(Left(CacheFailure())));
      });
    });
    runTestsDB(() {
      test('should get user from database.', () async {
        //arrange
        when(mockLocalDataSource.getUserDB(any, any))
            .thenAnswer((_) async => tUserModel);
        // act
        final result = await repository.getUser(email, password);
        // assert
        verify(mockLocalDataSource.getUserDB(any, any));
        expect(result, equals(Right(tUserModel)));
      });
      test('should throw database exception', () async {
        //arrange
        when(mockLocalDataSource.getUserDB(any, any)).thenThrow(DbException());
        // act
        final result = await repository.getUser(email, password);
        // assert
        verify(mockLocalDataSource.getUserDB(any, any));
        expect(result, equals(Left(DbFailure())));
      });
    });
  });
  group('setUser', () {
    final email = "test@email.com";
    final password = "123";
    final name = "Amir";
    final lastName = "Kargar";
    final tUserModel = UserModel(
      email: "test@email.com",
      password: '123',
      name: "Amir",
      lastName: "Kargar",
    );
    final User tUser = tUserModel;

    test('should set user to DB', () async {
      //arrange
      when(mockLocalDataSource.setUser(any, any, any, any))
          .thenAnswer((_) async => tUser);
      // act
      final result = await repository.setUser(email, password, name, lastName);
      // assert
      verify(mockLocalDataSource.setUser(any, any, any, any));
      expect(result, equals(Right(tUser)));
    });
    test('should throw  error fot set user to DB', () async {
      //arrange
      when(mockLocalDataSource.setUser(any, any, any, any))
          .thenThrow(DbException());
      // act
      final result = await repository.setUser(email, password, name, lastName);
      // assert
      verify(mockLocalDataSource.setUser(any, any, any, any));
      expect(result, equals(Left(DbFailure())));
    });
  });
}
