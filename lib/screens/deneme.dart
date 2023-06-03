import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_persembe/models/task_data.dart';

class DenemePage extends StatelessWidget {
  const DenemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app"),
      ),
      body: Consumer<TaskData>(
        builder: (context, taskData, child){
          return ListView.builder(
             itemBuilder: (context, index){
              return Text("data");
            },
             itemCount: taskData.taskCount,
          );
        }
      )
      
    );
  }
}
