import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;

  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          activeColor: Colors.lightBlueAccent,
          onChanged: checkboxCallback,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onLongPress: longPressCallback,
      ),
    );
  }
}
