import 'package:calendar_app/bloc/todo_bloc.dart';
import 'package:calendar_app/common/common_method.dart';
import 'package:calendar_app/components/todo_burtton.dart';
import 'package:calendar_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({
    super.key,
  });

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  DateTime _setDate = DateTime.now();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _key = GlobalKey<FormState>();

  final bloc = TodoBloc();

  final ValueNotifier<TodoStatus> selectedType = ValueNotifier(TodoStatus.work);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2024, 1, 1),
                          lastDate: DateTime(2024, 12, 31));
                      setState(() {
                        _setDate = date ?? _setDate;
                      });
                    },
                    child: Text(
                      CommonMethod.dateFormatToString(_setDate),
                      style: TextStyle(fontSize: 20),
                    ))),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: '할 일을 입력하세요',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '할 일을 입력해 주세요.';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: '내용을 입력해 주세요.',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: TodoStatus.values
                    .map((e) => Row(
                          children: [
                            TodoStatusButton(
                              type: e,
                              selectedType: selectedType,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    final title = _titleController.text;
                    final content = _contentController.text;
                    final date = CommonMethod.dateFormatToString(_setDate);
                    bloc.addTodo(
                        title: title,
                        content: content,
                        date: date,
                        status: selectedType.value);
                    Navigator.pop(context);
                  }
                },
                child: Text("저장"))
          ],
        ),
      ),
    );
  }
}
