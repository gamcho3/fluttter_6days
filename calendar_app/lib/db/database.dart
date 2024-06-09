import 'dart:io';

import 'package:calendar_app/model/todo_model.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@UseRowClass(Todo)
class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 30)();
  TextColumn get content => text().withLength(max: 50).nullable()();
  TextColumn get date => text().withLength(max: 30)();
  DateTimeColumn get createdAt => dateTime()();
}

@DriftDatabase(tables: [TodoItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<List<Todo>> getItems(String date) async {
    final items = select(todoItems)..where((e) => e.date.equals(date));
    return items.get();
  }

  Future<void> insertTodoItem({required TodoItemsCompanion item}) async {
    await into(todoItems).insert(item);
  }

  Future<void> deleteTodoItem(int id) async {
    await (delete(todoItems)..where((e) => e.id.equals(id))).go();
  }

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
