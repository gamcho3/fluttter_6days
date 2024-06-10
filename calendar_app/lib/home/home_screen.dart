import 'package:calendar_app/components/calendar.dart';
import 'package:calendar_app/components/todo_form.dart';
import 'package:calendar_app/components/todo_list_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomCalendar(),
            Flexible(
              child: TodoListWidget(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return TodoForm();
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
