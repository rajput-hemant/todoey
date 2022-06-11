import 'package:flutter/material.dart';

import '../models/task.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(
      title: 'Buy Milk',
      isTaskCompleted: false,
    ),
    Task(
      title: 'Buy Groceries',
      isTaskCompleted: true,
    ),
    Task(
      title: 'Buy anything',
      isTaskCompleted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].title,
          isChecked: tasks[index].isTaskCompleted,
          checkboxCallback: (checkBoxState) {
            setState(() => tasks[index].toggleTaskCompleted());
          },
        );
      },
    );
  }
}
