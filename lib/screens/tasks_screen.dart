import 'package:flutter/material.dart';

import '../models/task.dart';
import 'add_task_screen.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
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
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              addTaskCallback: (newTask) {
                setState(() => tasks.add(Task(title: newTask)));
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TasksList(tasks: tasks),
            ),
          ),
        ],
      ),
    );
  }
}
