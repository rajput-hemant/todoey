import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTite;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Enter the Task',
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (newText) => newTaskTite = newText,
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            ElevatedButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTite!);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
                elevation: 10,
                minimumSize: Size(0, 45),
              ),
            )
          ],
        ),
      ),
    );
  }
}
