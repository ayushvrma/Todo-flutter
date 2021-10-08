import 'package:moor/moor.dart';
part 'moor_database.g.dart'; //generated file

@DataClassName('Tasks Table')
class Tasks extends Table {
  IntColumn get id => integer()
      .autoIncrement()(); // same syntax as IntColumn get id => integer().autoIncrement().call(); since call is just a function call
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueData => dateTime().nullable()();
  BoolColumn get isDome => boolean().withDefault(Constant(false))();
}
