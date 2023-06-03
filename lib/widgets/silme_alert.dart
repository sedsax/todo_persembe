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
          title: const Text('Görevi Sil'),
          content: const Text('Bu görevi silmek istediğinizden emin misiniz?'),
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
