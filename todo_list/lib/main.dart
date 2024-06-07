import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/components/input_field.dart';
import 'package:todo_list/components/submit_button.dart';
import 'package:todo_list/components/todo_list_widget.dart';
import 'package:todo_list/todo_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 상태관리
    final ValueNotifier<List<TodoModel>> todoNotifier =
        ValueNotifier<List<TodoModel>>([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("오늘 할일"),
        ),
        body: Column(
          children: [
            Expanded(
              child: TodoListWidget(todoNotifier: todoNotifier),
            ),
            InputField(todoNotifier: todoNotifier)
          ],
        ),
      ),
    );
  }
}
