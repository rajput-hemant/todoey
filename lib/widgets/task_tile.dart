import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('This is task'),
      trailing: Checkbox(
        value: false,
        onChanged: (_) {},
      ),
    );
  }
}
