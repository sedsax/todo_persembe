import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_persembe/models/task.dart';

class TaskData extends ChangeNotifier {
  Box<Task> _taskBox = Hive.box<Task>('tasksBox');

  final List<Task> _completedTasks = [];
  final List<Task> _toDoTasks = [];

  TaskData() {
    _taskBox = Hive.box<Task>('tasksBox');
    _loadData();
  }

  void _loadData() {
    _completedTasks.clear();
    _toDoTasks.clear();
    for (final task in _taskBox.values) {
      if (task.isDone) {
        _completedTasks.add(task);
      } else {
        _toDoTasks.add(task);
      }
    }
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_taskBox.values.toList()); //Hive özelliği
  }

  UnmodifiableListView<Task> get completedTasks {
    return UnmodifiableListView(
        _taskBox.values.where((task) => task.isDone).toList());
  }
  

  UnmodifiableListView<Task> get toDoTasks {
    return UnmodifiableListView(
        _taskBox.values.where((task) => !task.isDone).toList());
  }

  int get taskCount {
    //return _tasks.length;
    return _taskBox.length; //Hive özelliği
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
    _taskBox.add(task); //Hive özelliği
    _toDoTasks.add(task);
    notifyListeners();
  }

  void addTaskToCompletedTasks(Task task) {
    // Tamamlanan görevlerin listesine ekleme
    task.isDone = true;
    _taskBox.put(task.key, task);
    _loadData();
    //notifyListeners();
  }

  void addTaskToTodoTasks(Task task) {
    // Yapılacak görevlerin listesine ekleme
    task.isDone = false;
    _taskBox.put(task.key, task);
    _loadData();
  }

  void updateTask(Task task) {
    task.toggleDone();
    _taskBox.put(task.key, task); //Hive özelliği
    _loadData();
   // notifyListeners();
  }

  void updateTaskStatus(BuildContext context, Task task, bool isCompleted) {
  task.isDone = isCompleted;
  notifyListeners();

  // Görevi ilgili sayfaya ekleme
  if (isCompleted) {
    _toDoTasks.remove(task);
  } else {
    _completedTasks.remove(task);
  }

  // Sayfa geçişlerini sağlama
  if (isCompleted) {
    Provider.of<TaskData>(context, listen: false)
        .addTaskToCompletedTasks(task);
  } else {
    Provider.of<TaskData>(context, listen: false).addTaskToTodoTasks(task);
  }

  // _completedTasks ve _toDoTasks listelerini güncelle
  _completedTasks.clear();
  _toDoTasks.clear();
  for (final task in _taskBox.values) {
    if (task.isDone) {
      _completedTasks.add(task);
    } else {
      _toDoTasks.add(task);
    }
  }
}

  void deleteTask(Task task) {
    _taskBox.delete(task.key); //Hive özelliği
    _loadData();
    //notifyListeners();
  }
}
