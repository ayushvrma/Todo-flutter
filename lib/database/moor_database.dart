import 'package:flutter/scheduler.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart'; //generated file

@DataClassName('Tasks Table')
class Tasks extends Table {
  IntColumn get id => integer()
      .autoIncrement()(); // same syntax as IntColumn get id => integer().autoIncrement().call(); since call is just a function call
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueData => dateTime().nullable()();
  BoolColumn get isDome => boolean().withDefault(Constant(false))();
}

@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements:
                true)); //calling the super constructor, db.sqlite name doesnt matter
  @override
  int get schemaVersion => 1;
}
