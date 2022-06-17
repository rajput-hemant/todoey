import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  final ScrollController controller;
  const TasksList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);
    return taskData.tasks.isNotEmpty
        ? ListView.builder(
            controller: controller,
            itemCount: taskData.tasksCount,
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                taskTitle: task.title,
                isChecked: task.isTaskCompleted,
                checkboxCallback: (checkBoxState) => taskData.updateTask(task),
                deleteCallback: () => taskData.deleteTask(task),
              );
            },
          )
        : Center(
            child: Text(
              'No Task Added Yet!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontFamily: "Quicksand",
                fontWeight: FontWeight.w900,
              ),
            ),
          );
  }
}
