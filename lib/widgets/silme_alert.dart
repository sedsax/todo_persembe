import 'package:flutter/material.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class DialogUtil {
  static Future<dynamic> showDeleteConfirmationDialog(
      BuildContext context, TaskData taskData, Task task) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(Icons.question_mark),
          iconColor:  const Color.fromARGB(255, 215, 189, 154),
          backgroundColor:  Colors.white,
          title: Container(
            color: const Color.fromARGB(255, 215, 189, 154),
            child: const Text('Görevi Sil', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
          content: const Text('Bu görevi silmek istediğinizden emin misiniz?', style: TextStyle(color:Color.fromARGB(255, 215, 189, 154),fontWeight: FontWeight.bold),),
          actions: [
            TextButton(
              child: const Text('İptal'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Sil'),
              onPressed: () {
                taskData.deleteTask(task);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
