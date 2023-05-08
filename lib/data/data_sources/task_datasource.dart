import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/data/models/task.dart';

abstract class TaskDatasource {
  Future<List<Task>> getAllTasks();
  Future<void> addTask(Task task);
  Future<void> deletetask(Task task);
  Future<void> deleteAllTasks();
  Future<void> updateTask(Task task);
}

class TaskLocal implements TaskDatasource {
  @override
  Future<List<Task>> getAllTasks() async {
    var taskBox = Hive.box<Task>('taskBox');
    return taskBox.values.toList();
  }

  @override
  Future<void> addTask(Task task) async {
    var taskBox = Hive.box<Task>('taskBox');
    await taskBox.add(task);
  }

  @override
  Future<void> deletetask(Task task) async {
    await task.delete();
  }

  @override
  Future<void> deleteAllTasks() async {
    var taskBox = Hive.box<Task>('taskBox');
    await taskBox.deleteAll(taskBox.keys);
  }

  @override
  Future<void> updateTask(Task task) async {
    await task.save();
  }
}
