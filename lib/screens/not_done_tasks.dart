import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_persembe/models/task_data.dart';
import 'package:todo_persembe/widgets/silme_alert.dart';

import '../widgets/not_done_task_tile.dart';


class NotDoneTasks extends StatelessWidget {
  const NotDoneTasks({super.key});
  static const Color app_theme_color = Color.fromARGB(255, 215, 189, 154);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: app_theme_color,
        title: Text('Yapılacak Görevler'),
      ),
      body: Consumer<TaskData>(
        builder: (context, taskData, child){
          if (taskData.toDoTaskCount != 0) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final task = taskData.toDoTasks[index];
                return NotDoneTaskTile(
                  taskTitle: task.name,
                  taskContent: task.content,
                  taskDate: task.taskDate,
                  longPressCallback: () {
                    //taskData.deleteTask(task);
                    DialogUtil.showDeleteConfirmationDialog(context, taskData, task);
                  }, 
                );
              },
              itemCount: taskData.toDoTaskCount,
            ),
          );
        } else {
          return Center(
            child: Image.asset('assets/ajanda.png'),
          );
        }
        },
        
        )
    );
  }
}
