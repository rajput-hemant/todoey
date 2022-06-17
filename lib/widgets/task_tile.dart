import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final isChecked;
  final String taskTitle;
  final VoidCallback deleteCallback;
  final Function(bool?) checkboxCallback;

  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.deleteCallback,
    required this.checkboxCallback,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(5),
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold,
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Checkbox(
          value: isChecked,
          activeColor: Colors.lightBlueAccent,
          onChanged: checkboxCallback,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        trailing: isLandscape
            ? OutlinedButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                onPressed: deleteCallback,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(11),
                  primary: Colors.red,
                  side: BorderSide(width: 1.0, color: Colors.red),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            : IconButton(
                onPressed: deleteCallback,
                icon: Icon(Icons.delete, color: Colors.red),
              ),
      ),
    );
  }
}
