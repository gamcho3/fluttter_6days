import 'package:flutter/material.dart';
import 'package:todo_list/components/input_field.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/todo_model.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.widget,
    required TextEditingController controller,
  }) : _controller = controller;

  final InputField widget;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration:
          BoxDecoration(color: Colors.purple.shade300, shape: BoxShape.circle),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          if (_controller.text.isEmpty)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('할일을 정확히 입력해 주세요.'),
              ),
            );

          widget.todoNotifier.value = [
            ...widget.todoNotifier.value,
            TodoModel(
              title: _controller.text,
            )
          ];
          _controller.clear();
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
