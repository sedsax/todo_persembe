import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_persembe/models/task_data.dart';
import 'package:todo_persembe/screens/add_task_screen.dart';
import 'package:todo_persembe/screens/done_tasks.dart';
import 'package:todo_persembe/widgets/tasks_list.dart';

import 'not_done_tasks.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});
  static const Color app_theme_color = Color.fromARGB(255, 215, 189, 154);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_theme_color,
      floatingActionButton: FloatingActionButton(
          backgroundColor: app_theme_color,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                        child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddTaskScreen(),
                    )));
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Row(
             //crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                  'Ajanda',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Görev',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                  ],
                ),
                    CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: IconButton(
                    icon: const Icon(Icons.list),
                    onPressed: () {
                      // AlertDialog oluşturup, iki sayfayı liste olarak göster
                      menuShowDialog(context);
                    },
                    iconSize: 30.0,
                    color: app_theme_color,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const TasksList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> menuShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Expanded(
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  const Icon(
                    Icons.find_in_page_outlined,
                    color: app_theme_color,
                    size: 60,
                  ),
                  Expanded(
                    child: Container(
                      color: app_theme_color,
                      child: SizedBox.expand(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const Text(
                                "Sayfalar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DoneTasks())).then((value) => Navigator.pop(context));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                        ),
                                        child: const Text("Tamamlanan\nGörevler",
                                            style: TextStyle(
                                                color: app_theme_color,
                                                fontWeight: FontWeight.bold)
                                          )
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const NotDoneTasks())).then((value) => Navigator.pop(context));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                        ),
                                        child: const Text("Yapılacak\nGörevler",
                                            style: TextStyle(
                                                color: app_theme_color,
                                                fontWeight: FontWeight.bold)
                                        )
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
