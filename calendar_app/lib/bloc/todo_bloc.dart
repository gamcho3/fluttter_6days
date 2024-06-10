import 'dart:async';

import 'package:calendar_app/common/dummy_data.dart';
import 'package:calendar_app/model/todo_model.dart';

class TodoBloc {
  static final TodoBloc _instance = TodoBloc._insternal();

  TodoBloc._insternal();

  factory TodoBloc() {
    return _instance;
  }

  final _todoListController = StreamController<List<Todo>>();

  Stream<List<Todo>> get todoListStream => _todoListController.stream;

  void getTiemWithDate(String date) async {
    final todos = DUMMY_DATA.where((element) => element.date == date).toList();
    _todoListController.sink.add(todos);
  }

  void addTodo(
      {required String title,
      required String? content,
      required String date,
      required TodoStatus status}) async {
    final item = Todo(
      id: DUMMY_DATA.length + 1,
      title: title,
      content: content,
      date: date,
      status: status.name,
      createdAt: DateTime.now(),
    );
    DUMMY_DATA.add(item);

    getTiemWithDate(date);
  }

  // void remove(Todo todo) {
  //   todoList.remove(todo);
  //   todoSink.add(todoList);
  // }

  void dispose() {
    _todoListController.close();
  }
}
