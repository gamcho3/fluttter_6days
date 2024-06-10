import 'package:calendar_app/bloc/todo_bloc.dart';
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
  final TodoBloc _todoBloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
        stream: _todoBloc.todoListStream,
        builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          if (data.isEmpty) {
            return const Center(child: Text('목록이 비었습니다.'));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return TodoWidget(
                todo: data[index],
              );
            },
          );
        });
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
