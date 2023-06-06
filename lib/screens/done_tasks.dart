import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_persembe/models/task_data.dart';
import 'package:todo_persembe/widgets/silme_alert.dart';

import '../widgets/done_task_tile.dart';
import '../widgets/not_done_task_tile.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});
  static const Color app_theme_color = Color.fromARGB(255, 215, 189, 154);

  @override
  Widget build(BuildContext context) {
    //final taskData = Provider.of<TaskData>(context);
    // final completedTasks = taskData.completedTasks;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: app_theme_color,
          title: Text('Tamamlanan Görevler'),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                      '${Provider.of<TaskData>(context).completedTaskCount} Görev',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
              ),
            ),
          ],
        ),
        body: Consumer<TaskData>(
          builder: (context, taskData, child) {
            if (taskData.completedTaskCount != 0) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final task = taskData.completedTasks[index];
                    return DoneTaskTile(
                      taskTitle: task.name,
                      taskContent: task.content,
                      taskDate: task.taskDate,
                      longPressCallback: () {
                        //taskData.deleteTask(task);
                        DialogUtil.showDeleteConfirmationDialog(context, taskData, task);
                       
                      },
                    );
                  },
                  itemCount: taskData.completedTaskCount,
                ),
              );
            } else {
              return Center(
                child: Image.asset('assets/ajanda.png'),
              );
            }
          },
        ));
  }
  
}