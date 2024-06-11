import 'package:calendar_app/db/database.dart';
import 'package:calendar_app/model/todo_model.dart';
import 'package:drift/drift.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos({required String date});
  Future<void> addNewTodo(TodoItemsCompanion todo);
  // Future<void> updateTodo(Todo todo);
  Future<void> deleteTodoById(int id);
}

class TodoRepositoryImpl implements TodoRepository {
  final AppDatabase _database;

  TodoRepositoryImpl(this._database);

  @override
  Future<List<Todo>> getTodos({required String date}) async {
    return await _database.getItems(date);
  }

  @override
  Future<void> addNewTodo(TodoItemsCompanion todoItem) {
    return _database.insertTodoItem(item: todoItem);
  }

  @override
  Future<void> deleteTodoById(int id) {
    return _database.deleteTodoItem(id);
  }
}
