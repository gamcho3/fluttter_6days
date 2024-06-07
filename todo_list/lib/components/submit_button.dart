import 'package:flutter/material.dart';
import 'package:todo_list/components/input_field.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/todo_model.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.controller,
    required this.todoNotifier,
  });

  final TextEditingController controller;
  final ValueNotifier<List<TodoModel>> todoNotifier;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration:
          BoxDecoration(color: Colors.purple.shade300, shape: BoxShape.circle),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          if (controller.text.isEmpty)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('할일을 정확히 입력해 주세요.'),
              ),
            );

          todoNotifier.value = [
            ...todoNotifier.value,
            TodoModel(
              title: controller.text,
            )
          ];
          controller.clear();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
