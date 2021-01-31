import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'day_database.g.dart';

class TabelUsers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().withLength(min: 35, max: 50)();
  TextColumn get name => text().withLength(min: 35, max: 50)();
  TextColumn get lastName => text().withLength(min: 35, max: 50)();
  TextColumn get password => text().withLength(min: 8, max: 50)();
}

@UseMoor(tables: [TabelUsers])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));
  @override
  int get schemaVersion => 1;

  Future<List<TabelUser>> getAllTasks() => select(tabelUsers).get();
  Stream<List<TabelUser>> watchAllTasks() => select(tabelUsers).watch();
  Future insertTask(TabelUser user) => into(tabelUsers).insert(user);
  Future updateTask(TabelUser user) => update(tabelUsers).replace(user);
  Future deleteTask(TabelUser user) => delete(tabelUsers).delete(user);
}
