
import 'package:hive_flutter/hive_flutter.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject{ //Hive ile nesneyi depolamak için HiveObject sınıfından türetilmesi gerekli

  @HiveField(0)
  late final String name;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final String taskDate;

  @HiveField(3)
  bool isDone;

  Task({required this.name, required this.content, required this.taskDate, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
    save(); //Hive özelliği
  }
}