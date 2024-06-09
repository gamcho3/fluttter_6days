import 'dart:async';

import 'package:calendar_app/db/database.dart';
import 'package:calendar_app/model/todo_model.dart';
import 'package:calendar_app/repository/todo_repository.dart';
import 'package:intl/intl.dart';

class TodoBloc {
  final TodoRepository _todoRepository = TodoRepositoryImpl(AppDatabase());

  static final TodoBloc _instance = TodoBloc._insternal();

  TodoBloc._insternal();

  final _todoListController = StreamController<List<Todo>>();

  Stream<List<Todo>> get todoListStream => _todoListController.stream;

  factory TodoBloc() {
    return _instance;
  }

  void getTiemWithDate(DateTime time) async {
    final dateToString = DateFormat('yyyy-MM-dd').format(time);
    final todos = await _todoRepository.getTodos(date: dateToString);
    _todoListController.sink.add(todos);
  }

  // void remove(Todo todo) {
  //   todoList.remove(todo);
  //   todoSink.add(todoList);
  // }

  // void dispose() {
  //   _todoController.close();
  // }
}
