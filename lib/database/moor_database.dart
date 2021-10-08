import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';

part 'moor_database.g.dart';

class Tasks extends Table {
  IntColumn get id => integer()
      .autoIncrement()(); // same syntax as IntColumn get id => integer().autoIncrement().call(); since call is just a function call
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueData => dateTime().nullable()();
  BoolColumn get isDome => boolean().withDefault(Constant(false))();
}

@UseMoor(tables: [Tasks])
class AppDB extends _$AppDB {
  AppDB(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
