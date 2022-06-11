class Task {
  final String title;
  bool isTaskCompleted;

  Task({required this.title, this.isTaskCompleted = false});

  void toggleTaskCompleted() {
    isTaskCompleted = !isTaskCompleted;
  }
}
