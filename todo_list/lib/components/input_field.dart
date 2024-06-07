import 'package:flutter/material.dart';
import 'package:todo_list/components/submit_button.dart';
import 'package:todo_list/todo_model.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.todoNotifier,
  });

  final ValueNotifier<List<TodoModel>> todoNotifier;

  @override
  State<InputField> createState() => _InputFIeldState();
}

class _InputFIeldState extends State<InputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SubmitButton(
            controller: _controller,
            todoNotifier: widget.todoNotifier,
          )
        ],
      ),
    );
  }
}
