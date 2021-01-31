import 'package:Day/Feature/Login/data/datasources/user_local_datasourec.dart';
import 'package:Day/Feature/Login/data/models/user_model.dart';
import 'package:Day/core/database/day_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockDb extends Mock implements AppDatabase {}

void main() {
  UserLocalDataSourceImp dataSource;
  MockSharedPreferences mockSharedPreferences;
  MockDb mockDb;
  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    mockDb = MockDb();
    dataSource = UserLocalDataSourceImp(
        sharedPreferences: mockSharedPreferences, db: mockDb);
  });
  group('get user from cache', () {
    final tUserModel = UserModel(
        email: "email@email.com",
        password: "123",
        name: "Amir",
        lastName: "Kargar");
    final tUserCache = ["email@email.com", "123", "Amir", "Kargar"];
    test(
      'should return true for logged user',
      () async {
        // arrange
        when(mockSharedPreferences.getBool(any)).thenAnswer((_) => true);
        // act
        final result = await dataSource.isLogged;
        // assert
        verify(mockSharedPreferences.getBool('ISLOGGED'));
        expect(result, equals(true));
      },
    );
    test(
      'should return user from cache',
      () async {
        // arrange
        when(mockSharedPreferences.getStringList(any))
            .thenAnswer((_) => tUserCache);
        // act
        final result = await dataSource.getUser();
        // assert
        verify(mockSharedPreferences.getStringList('USER'));
        expect(result, equals(tUserModel));
      },
    );
  });
  group('get user from DB', () {
    final List<TabelUser> tListUser = [];
    final tUserModel = UserModel(
        email: "email@email.com",
        password: "123",
        name: "Amir",
        lastName: "Kargar");
    final email = "email@email.com";
    final password = "123";
    test(
      'should return user from DB',
      () async {
        // arrange
        when(mockDb.getAllTasks()).thenAnswer((_) async => tListUser);
        // act
      },
    );
  });
}
