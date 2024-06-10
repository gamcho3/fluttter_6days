import 'dart:async';

import 'package:calendar_app/db/database.dart';
import 'package:calendar_app/model/todo_model.dart';
import 'package:calendar_app/repository/todo_repository.dart';
import 'package:drift/drift.dart';
import 'package:intl/intl.dart';

class TodoBloc {
  final TodoRepository _todoRepository = TodoRepositoryImpl(AppDatabase());

  static final TodoBloc _instance = TodoBloc._insternal();

  TodoBloc._insternal();

  factory TodoBloc() {
    return _instance;
  }

  final _todoListController = StreamController<List<Todo>>();

  Stream<List<Todo>> get todoListStream => _todoListController.stream;

  void getTiemWithDate(String date) async {
    final todos = await _todoRepository.getTodos(date: date);
    _todoListController.sink.add(todos);
  }

  void addTodo(
      {required String title,
      required String? content,
      required String date,
      required TodoStatus status}) async {
    final item = TodoItemsCompanion.insert(
      title: title,
      content: Value(content),
      status: status.name,
      date: date,
      createdAt: Value(DateTime.now()),
    );
    await _todoRepository.addNewTodo(item);
    getTiemWithDate(date);
  }

  // void remove(Todo todo) {
  //   todoList.remove(todo);
  //   todoSink.add(todoList);
  // }

  void deleteAll() {
    _todoRepository.deleteAll();
  }

  void dispose() {
    _todoListController.close();
  }
}
