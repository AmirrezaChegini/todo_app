import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String text;

  @HiveField(1, defaultValue: false)
  bool complete;

  @HiveField(2, defaultValue: TaskPriority.low)
  TaskPriority taskPriority;

  Task(this.text, this.complete, this.taskPriority);
}

@HiveType(typeId: 2)
enum TaskPriority {
  @HiveField(0)
  low,

  @HiveField(1)
  normal,

  @HiveField(2)
  high,
}
