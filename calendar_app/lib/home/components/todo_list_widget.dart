import 'package:calendar_app/common/dummy_data.dart';
import 'package:calendar_app/model/todo_model.dart';

import 'package:flutter/material.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({
    super.key,
  });

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DUMMY_DATA.length,
      itemBuilder: (context, index) {
        return TodoWidget(
          todo: DUMMY_DATA[index],
        );
      },
    );
  }
}

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.content ?? ''),
      onTap: () {},
      trailing: Container(
        width: 20,
        decoration:
            BoxDecoration(color: setColor(todo.status), shape: BoxShape.circle),
      ),
    );
  }

  Color setColor(String status) {
    switch (status) {
      case 'work':
        return TodoStatus.work.color;
      case 'personal':
        return TodoStatus.personal.color;
      case 'other':
        return TodoStatus.other.color;
      default:
        return Colors.black;
    }
  }
}
