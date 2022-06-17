import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import 'add_task_screen.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskData>(context).tasks;

    var appBar = AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.lightBlueAccent,
      title: Text(
        'Todoey',
        style: TextStyle(
          fontSize: 40,
          fontFamily: "Quicksand",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 33),
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskScreen(),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: Text(
                    '${Provider.of<TaskData>(context).tasksCount} Tasks',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    child: Image.asset(
                      'assets/images/bg.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(flex: 2, child: SizedBox())
              ],
            ),
            DraggableScrollableSheet(
              minChildSize: 0.19,
              maxChildSize: tasks.isEmpty ? 0.19 : 0.95,
              initialChildSize: tasks.isEmpty ? 0.19 : 0.5,
              builder: (context, scrollController) => Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TasksList(controller: scrollController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
