// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String name;
  final DateTime dueData;
  final bool isDome;
  Task(
      {@required this.id,
      @required this.name,
      this.dueData,
      @required this.isDome});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Task(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      dueData: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}due_data']),
      isDome: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_dome']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || dueData != null) {
      map['due_data'] = Variable<DateTime>(dueData);
    }
    if (!nullToAbsent || isDome != null) {
      map['is_dome'] = Variable<bool>(isDome);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      dueData: dueData == null && nullToAbsent
          ? const Value.absent()
          : Value(dueData),
      isDome:
          isDome == null && nullToAbsent ? const Value.absent() : Value(isDome),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dueData: serializer.fromJson<DateTime>(json['dueData']),
      isDome: serializer.fromJson<bool>(json['isDome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'dueData': serializer.toJson<DateTime>(dueData),
      'isDome': serializer.toJson<bool>(isDome),
    };
  }

  Task copyWith({int id, String name, DateTime dueData, bool isDome}) => Task(
        id: id ?? this.id,
        name: name ?? this.name,
        dueData: dueData ?? this.dueData,
        isDome: isDome ?? this.isDome,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dueData: $dueData, ')
          ..write('isDome: $isDome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(dueData.hashCode, isDome.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.name == this.name &&
          other.dueData == this.dueData &&
          other.isDome == this.isDome);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> dueData;
  final Value<bool> isDome;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dueData = const Value.absent(),
    this.isDome = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.dueData = const Value.absent(),
    this.isDome = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Task> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<DateTime> dueData,
    Expression<bool> isDome,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dueData != null) 'due_data': dueData,
      if (isDome != null) 'is_dome': isDome,
    });
  }

  TasksCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<DateTime> dueData,
      Value<bool> isDome}) {
    return TasksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dueData: dueData ?? this.dueData,
      isDome: isDome ?? this.isDome,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dueData.present) {
      map['due_data'] = Variable<DateTime>(dueData.value);
    }
    if (isDome.present) {
      map['is_dome'] = Variable<bool>(isDome.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dueData: $dueData, ')
          ..write('isDome: $isDome')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedColumn<String> _name;
  @override
  GeneratedColumn<String> get name => _name ??= GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _dueDataMeta = const VerificationMeta('dueData');
  GeneratedColumn<DateTime> _dueData;
  @override
  GeneratedColumn<DateTime> get dueData =>
      _dueData ??= GeneratedColumn<DateTime>('due_data', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _isDomeMeta = const VerificationMeta('isDome');
  GeneratedColumn<bool> _isDome;
  @override
  GeneratedColumn<bool> get isDome =>
      _isDome ??= GeneratedColumn<bool>('is_dome', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'CHECK (is_dome IN (0, 1))',
          defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, name, dueData, isDome];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('due_data')) {
      context.handle(_dueDataMeta,
          dueData.isAcceptableOrUnknown(data['due_data'], _dueDataMeta));
    }
    if (data.containsKey('is_dome')) {
      context.handle(_isDomeMeta,
          isDome.isAcceptableOrUnknown(data['is_dome'], _isDomeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    return Task.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
