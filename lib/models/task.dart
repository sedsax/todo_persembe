class Task {
  late final String name;
  final String content;
  final String taskDate;
  bool isDone;

  Task({required this.name, required this.content, required this.taskDate, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}