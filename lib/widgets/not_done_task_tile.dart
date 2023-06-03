import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotDoneTaskTile extends StatelessWidget {
  final String taskTitle;
  final String taskContent;
  late String taskDate;
  final VoidCallback longPressCallback;

  NotDoneTaskTile(
      {super.key,
      required this.taskTitle,
      required this.taskContent,
      required this.taskDate,
      required this.longPressCallback});

 static const Color app_theme_color = Color.fromARGB(255, 236, 224, 209);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Card(
          color: app_theme_color,
          shadowColor: app_theme_color,
          child: ListTile(
            onLongPress: longPressCallback,
            title: Text(
              taskTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(taskDate,style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),) ,
            subtitle: Text(
              "\n$taskContent",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ));
  }
}
