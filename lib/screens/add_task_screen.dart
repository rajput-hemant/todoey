import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final newTaskTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String? newTaskTitle;
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: null,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'New Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              isDense: true,
              labelText: 'Enter the Task',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // onChanged: (newText) => newTaskTitle = newText,
            controller: newTaskTitleController,
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          ElevatedButton(
            onPressed: () {
              setState(() => Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitleController.text));
              Navigator.pop(context);
            },
            child: Text(
              'Add',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Quicksand",
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 10,
              primary: Colors.lightBlueAccent,
              minimumSize: Size(0, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );
  }
}
