import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/data/models/task.dart';

Future<void> initDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskPriorityAdapter());
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('taskBox');
}
