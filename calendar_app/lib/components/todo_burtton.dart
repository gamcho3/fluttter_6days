import 'package:calendar_app/model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoStatusButton extends StatefulWidget {
  final TodoStatus type;
  final ValueNotifier<TodoStatus> selectedType;

  const TodoStatusButton({
    super.key,
    required this.type,
    required this.selectedType,
  });

  @override
  State<TodoStatusButton> createState() => _TodoStatusButtonState();
}

class _TodoStatusButtonState extends State<TodoStatusButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.selectedType.value = widget.type;
      },
      child: ValueListenableBuilder(
          valueListenable: widget.selectedType,
          builder: (context, value, _) {
            return Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: widget.type.color,
                  shape: BoxShape.circle,
                  border: widget.type == value
                      ? Border.all(
                          color: Colors.black,
                          width: 2,
                        )
                      : null),
              child: Center(
                child: Text(
                  widget.type.name.split('')[0].toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            );
          }),
    );
  }
}
