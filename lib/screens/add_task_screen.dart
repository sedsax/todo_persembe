import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_persembe/models/task_data.dart';

import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});
  static const Color app_theme_color = Color.fromARGB(255, 215, 189, 154);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    String? newTaskContent;
    String? newTaskDate;
   // late Task? _task = Task(name: newTaskTitle!, content: newTaskContent!, taskDate: newTaskDate!);

    String datetime = DateFormat("dd:MM:yyyy - HH:mm").format(DateTime.now());
    newTaskDate = datetime;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Not Al',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: app_theme_color,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newTitle) {
                newTaskTitle = newTitle;
              },
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newContent) {
                newTaskContent = newContent;
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: app_theme_color,
              ),
              child: const Text(
                'Ekle',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (newTaskTitle != null) {
                  // başlık boş değilse eklensin, içerik her zaman eklenmese de olur
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle!, newTaskContent ?? '', newTaskDate?? '');
                   //Provider.of<TaskData>(context, listen: false).addTaskToTodoTasks(_task);
                }

                //Provider.of<TaskData>(context).addTask(newTaskTitle!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
