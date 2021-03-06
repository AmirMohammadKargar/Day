import 'package:Day/Feature/Login/data/datasources/user_local_datasourec.dart';
import 'package:Day/Feature/Login/data/repository/user_repository_impl.dart';
import 'package:Day/Feature/Login/domain/repository/user_repository.dart';
import 'package:Day/Feature/Login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(
    () => LoginBloc(
      setUsers: sl(),
      getUsers: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetUsers(sl(), sl()));
  sl.registerLazySingleton(() => SetUsers(sl(), sl(), sl(), sl()));
  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImp(sharedPreferences: sl(), db: sl()),
  );
  Future<void> init() async {
    //! External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }
}
