import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is task',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckBox(
        checkBoxState: isChecked,
        toggleCheckboxState: (checkBoxState) => setState(() => isChecked = checkBoxState!),
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final Function(bool?) toggleCheckboxState;

  const TaskCheckBox({
    super.key,
    required this.checkBoxState,
    required this.toggleCheckboxState,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkBoxState,
      onChanged: toggleCheckboxState,
    );
  }
}
