import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_persembe/models/task_data.dart';
import 'package:todo_persembe/widgets/silme_alert.dart';
import 'package:todo_persembe/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    // String datetime = DateTime.now().day.toString();
    //String taskTime = DateFormat("dd-MM-yyyy").format(DateTime.now());

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        if (taskData.taskCount != 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final task = taskData.tasks[index];
                return TaskTile(
                  taskTitle: task.name,
                  taskContent: task.content,
                  isChecked: task.isDone,
                  taskDate: task.taskDate,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  //   Provider.of<TaskData>(context, listen: false).addTaskToCompletedTasks(task);
                    taskData.updateTaskStatus(context, task, checkboxState!);
                  },
                  longPressCallback: () {
                    //taskData.deleteTask(task);
                    DialogUtil.showDeleteConfirmationDialog(context, taskData, task);
                  },
                );
              },
              itemCount: taskData.taskCount,
            ),
          );
        } else {
          return Center(
            child: Image.asset('assets/ajanda.png'),
          );
        }
      },
    );
  }
}
