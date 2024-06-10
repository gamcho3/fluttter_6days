import 'package:calendar_app/model/todo_model.dart';

final DUMMY_DATA = [
  Todo(
    id: 1,
    title: 'Flutter Study',
    date: '2024-06-11',
    status: TodoStatus.work.name,
    content: 'Flutter Study',
    createdAt: DateTime.now(),
  ),
  Todo(
    id: 2,
    title: 'Dart Study',
    date: '2024-06-13',
    status: TodoStatus.work.name,
    content: 'Dart Study',
    createdAt: DateTime.now(),
  ),
  Todo(
    id: 3,
    title: 'English Study',
    date: '2024-06-15',
    status: TodoStatus.personal.name,
    content: 'English Study',
    createdAt: DateTime.now(),
  ),
  Todo(
    id: 4,
    title: 'Math Study',
    date: '2024-06-17',
    status: TodoStatus.personal.name,
    content: 'Math Study',
    createdAt: DateTime.now(),
  ),
  Todo(
    id: 5,
    title: 'Science Study',
    date: '2024-06-19',
    status: TodoStatus.other.name,
    content: 'Science Study',
    createdAt: DateTime.now(),
  ),
  Todo(
    id: 6,
    title: 'History Study',
    date: '2024-06-20',
    status: TodoStatus.other.name,
    content: 'History Study',
    createdAt: DateTime.now(),
  ),
];
