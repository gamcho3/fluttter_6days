import 'package:calendar_app/db/database.dart';
import 'package:calendar_app/model/todo_model.dart';
import 'package:drift/drift.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos({required String date});
  Future<void> addNewTodo(Todo todo);
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
  Future<void> addNewTodo(Todo todo) {
    return _database.insertTodoItem(
        item: TodoItemsCompanion.insert(
            title: todo.title,
            content: Value(todo.content),
            createdAt: todo.createdAt,
            date: todo.date));
  }

  @override
  Future<void> deleteTodoById(int id) {
    return _database.deleteTodoItem(id);
  }
}
