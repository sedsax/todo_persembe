import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_persembe/models/task_data.dart';
import 'package:todo_persembe/screens/add_task_screen.dart';
import 'package:todo_persembe/screens/done_tasks.dart';
import 'package:todo_persembe/widgets/tasks_list.dart';
import 'package:todo_persembe/screens/not_done_tasks.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  
  static const Color appThemeColor = Color.fromARGB(255, 215, 189, 154);

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  void _navigateToDoneTasks(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DoneTasks()),
    ).then((value) => Navigator.pop(context));
  }

  void _navigateToNotDoneTasks(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotDoneTasks()),
    ).then((value) => Navigator.pop(context));
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: SizedBox(
            height: 200,
            child: Column(
              children: [
                const Icon(
                  Icons.find_in_page_outlined,
                  color: appThemeColor,
                  size: 60,
                ),
                Expanded(
                  child: Container(
                    color: appThemeColor,
                    child: SizedBox.expand(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            const Text(
                              "Sayfalar",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _navigateToDoneTasks(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      "Tamamlanan\nGörevler",
                                      style: TextStyle(
                                        color: appThemeColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _navigateToNotDoneTasks(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      "Yapılacak\nGörevler",
                                      style: TextStyle(
                                        color: appThemeColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: appThemeColor,
        child: const Icon(Icons.add),
        onPressed: () {
          _showModalBottomSheet(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Row(
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
                    const SizedBox(height: 10),
                    Text(
                      '${Provider.of<TaskData>(context).taskCount} Görev',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
                      _showDialog(context);
                    },
                    iconSize: 30.0,
                    color: appThemeColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
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
}
