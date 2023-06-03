import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_persembe/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];
  final List<Task> _completedTasks = [];
  final List<Task> _toDoTasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Task> get completedTasks {
    return UnmodifiableListView(_completedTasks);
  }

  UnmodifiableListView<Task> get toDoTasks {
    return UnmodifiableListView(_toDoTasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  int get completedTaskCount {
    return _completedTasks.length;
  }

   int get toDoTaskCount {
    return _toDoTasks.length;
  }

  void addTask(String newTaskTitle, String newTaskContent, String newTaskDate) {
    final task = Task(
        name: newTaskTitle, content: newTaskContent, taskDate: newTaskDate);
    _tasks.add(task);
    _toDoTasks.add(task);
    notifyListeners();
  }

  void addTaskToCompletedTasks(Task task) {
    //Tamamlanan görevlerin listesi
    _completedTasks.add(task);
    notifyListeners();
  }

  void addTaskToTodoTasks(Task task) {
    // Yapılacak görevlerin listesi
    _toDoTasks.add(task);
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void updateTaskStatus(BuildContext context, Task task, bool isCompleted) {
    task.isDone = isCompleted;
    notifyListeners();
    // Görevi ilgili sayfaya ekleme
    if (isCompleted) {
      Provider.of<TaskData>(context, listen: false)
          .addTaskToCompletedTasks(task);
      _toDoTasks.remove(task);
    } else {
      //addTaskToTodoTasks(task);
      _completedTasks.remove(task);
      Provider.of<TaskData>(context, listen: false).addTaskToTodoTasks(task);
    }
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _completedTasks.remove(task);
    _toDoTasks.remove(task);
    notifyListeners();
  }
}
