import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final String taskContent;
  late String taskDate;
  final void Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;

  TaskTile(
      {super.key,
      required this.isChecked,
      required this.taskTitle,
      required this.taskContent,
      required this.taskDate,
      required this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
   // taskDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
   // taskDate = DateFormat("dd:MM:yyyy - HH:mm").format(DateTime.now());
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          onLongPress: longPressCallback,
          title: Text(
            taskTitle,
            style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
              color: isChecked ? Colors.red : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Checkbox(
            activeColor: Colors.green[400],
            value: isChecked,
            onChanged: checkboxCallback,
          ),
          subtitle: Text(
            "$taskDate\n$taskContent",
            style: TextStyle(
              color: Colors.black,
              decoration: isChecked ? TextDecoration.lineThrough : null,
              // color: isChecked ? Colors.red : null,
              fontWeight: isChecked ? FontWeight.w600 : null,
            ),
          ),
        ));
  }
}
