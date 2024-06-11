import 'package:calendar_app/bloc/todo_bloc.dart';
import 'package:calendar_app/model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  final int index;

  const TodoWidget({
    super.key,
    required this.todo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = TodoBloc();
    return Dismissible(
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
      ),
      key: UniqueKey(),
      onDismissed: (direction) {
        bloc.removeTodo(todo);
      },
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.content ?? ''),
        tileColor: index.isEven ? Colors.teal.withOpacity(0.1) : Colors.white,
        onTap: () {},
        trailing: Container(
          width: 20,
          decoration: BoxDecoration(
              color: setColor(todo.status), shape: BoxShape.circle),
        ),
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
