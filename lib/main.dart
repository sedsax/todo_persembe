import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_persembe/models/task.dart';
import 'package:todo_persembe/models/task_data.dart';
import 'package:todo_persembe/screens/tasks_screen.dart';

Future<void> main() async {
  await Hive.initFlutter('GörevlerHive');
  Hive.registerAdapter(TaskAdapter()); //Hive ı başlatmadan önce Adaptör ü kaydediyoruz
  await Hive.openBox<Task>('tasksBox');

  //Hive.registerAdapter(TaskAdapter());

  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}