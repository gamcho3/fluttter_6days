import 'package:calendar_app/bloc/todo_bloc.dart';
import 'package:calendar_app/common/common_method.dart';
import 'package:calendar_app/components/todo_widget.dart';
import 'package:calendar_app/model/todo_model.dart';
import 'package:calendar_app/repository/todo_repository.dart';
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
  void initState() {
    // 현재 날짜의 할일을 가져옴
    _todoBloc.getTodoWithDate(CommonMethod.dateFormatToString(DateTime.now()));
    super.initState();
  }

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
                index: index,
              );
            },
          );
        });
  }
}
