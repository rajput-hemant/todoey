import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;

  const AddTaskScreen({super.key, required this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    String? newTaskTite;
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                onPressed: () => addTaskCallback(newTaskTite),
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
      ),
    );
  }
}
