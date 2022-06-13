import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);
    return ListView.builder(
      itemCount: taskData.tasksCount,
      itemBuilder: (context, index) {
        final task = taskData.tasks[index];
        return TaskTile(
          taskTitle: task.title,
          isChecked: task.isTaskCompleted,
          checkboxCallback: (checkBoxState) => taskData.updateTask(task),
          longPressCallback: () => taskData.deleteTask(task),
        );
      },
    );
  }
}
