import 'dart:async';

import 'package:todo_list/task.dart';
import 'package:todo_list/task_dao.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Task])
abstract class FlutterDatabase extends FloorDatabase {
  TaskDao get taskDao;
}
