import 'package:flutter/material.dart';
import 'package:todo_list/todo_model.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({
    super.key,
    required this.todoNotifier,
  });

  final ValueNotifier<List<TodoModel>> todoNotifier;

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        // Notifier 등록
        valueListenable: widget.todoNotifier,
        builder: (context, list, child) {
          if (list.isEmpty) {
            return const Center(
              child: Text("할일이 추가해 주세요."),
            );
          }

          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return TodoWidget(
                  todo: list[index],
                );
              });
        });
  }
}

class TodoWidget extends StatefulWidget {
  final TodoModel todo;

  const TodoWidget({
    super.key,
    required this.todo,
  });

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(widget.todo.title),
        onTap: () {
          // 클릭할때마다 isDone의 상태를 변경
          widget.todo.copyWith(isDone: !widget.todo.isDone);
          setState(() {});
        },
        trailing: widget.todo.isDone
            ? Icon(
                Icons.check_circle_rounded,
                color: Colors.green,
              )
            : Icon(Icons.circle_outlined),
      ),
    );
  }
}
