import 'package:Day/Feature/Login/domain/entities/user.dart';
import 'package:Day/Feature/Login/domain/usecases/get_user.dart';
import 'package:Day/Feature/Login/domain/usecases/set_user.dart';
import 'package:Day/Feature/Login/presentation/bloc/login_bloc.dart';
import 'package:Day/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetUser extends Mock implements GetUser {}

class MockSetUser extends Mock implements SetUser {}

void main() {
  LoginBloc bloc;
  MockGetUser mockGetUser;
  MockSetUser mockSetUser;

  setUp(() {
    mockGetUser = MockGetUser();
    mockSetUser = MockSetUser();

    bloc = LoginBloc(
      getUsers: mockGetUser,
      setUsers: mockSetUser,
    );
  });
  test('initialState should be Empty', () {
    // assert
    expect(bloc.initialState, equals(Empty()));
  });
  group('GetUser', () {
    final email = "email@email.com";
    final password = "123";
    final name = "Amir";
    final lastName = "Kargar";
    final tUser = User(
        email: "email@email.com",
        password: "123",
        name: "Amir",
        lastName: "Kargar");
    test(
      'should get user from use case',
      () async {
        // arrange
        when(mockGetUser(any)).thenAnswer((_) async => Right(tUser));
        // act
        bloc.dispatch(GetUsers(email, password));
        await untilCalled(mockGetUser(any));
        // assert
        verify(mockGetUser(ParamsOne(email: email, password: password)));
      },
    );
    test(
      'should emit [Loading, Loaded] when user is gotten successfully',
      () async {
        // arrange

        when(mockGetUser(any)).thenAnswer((_) async => Right(tUser));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Loaded(user: tUser),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.dispatch(GetUsers(email, password));
      },
    );
    test(
      'should emit [Loading, Error] when getting user fails',
      () async {
        // arrange

        when(mockGetUser(any)).thenAnswer((_) async => Left(DbFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.dispatch(GetUsers(email, password));
      },
    );
    test(
      'should emit [Loading, Error] with a proper message for the error when getting user fails',
      () async {
        // arrange

        when(mockGetUser(any)).thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.dispatch(GetUsers(email, password));
      },
    );
  });
  group('SetUser', () {
    final email = "email@email.com";
    final password = "123";
    final name = "Amir";
    final lastName = "Kargar";
    final tUser = User(
        email: "email@email.com",
        password: "123",
        name: "Amir",
        lastName: "Kargar");
    test(
      'should set user from use case',
      () async {
        // arrange
        when(mockSetUser(any)).thenAnswer((_) async => Right(tUser));
        // act
        bloc.dispatch(SetUsers(email, password, name, lastName));
        await untilCalled(mockSetUser(any));
        // assert
        verify(mockSetUser(Params(
            email: email, password: password, name: name, lastName: lastName)));
      },
    );
    test(
      'should emit [Loading, Loaded] when user is setten successfully',
      () async {
        // arrange

        when(mockSetUser(any)).thenAnswer((_) async => Right(tUser));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Loaded(user: tUser),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.dispatch(SetUsers(email, password, name, lastName));
      },
    );
    test(
      'should emit [Loading, Error] when setting user fails',
      () async {
        // arrange

        when(mockSetUser(any)).thenAnswer((_) async => Left(DbFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.dispatch(SetUsers(email, password, name, lastName));
      },
    );
    test(
      'should emit [Loading, Error] with a proper message for the error when setting user fails',
      () async {
        // arrange

        when(mockSetUser(any)).thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.dispatch(SetUsers(email, password, name, lastName));
      },
    );
  });
}
