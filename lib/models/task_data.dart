import 'package:flutter/foundation.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    // Task(title: 'Buy Milk'),
    // Task(title: 'Buy Groceries'),
    // Task(title: 'Buy anything'),
  ];

  List<Task> get tasks {
    return [..._tasks];
  }

  int get tasksCount {
    return _tasks.length;
  }

  void addTask(String newTaskTite) {
    final task = Task(title: newTaskTite);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleTaskCompleted();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
