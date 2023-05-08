import 'package:flutter/material.dart';
import 'package:todo_app/data/models/task.dart';

class GetTaskPriority {
  static TaskPriority priority(int priority) {
    switch (priority) {
      case 2:
        return TaskPriority.high;
      case 1:
        return TaskPriority.normal;
      default:
        return TaskPriority.low;
    }
  }

  static int index(TaskPriority taskPriority) {
    switch (taskPriority) {
      case TaskPriority.high:
        return 2;
      case TaskPriority.normal:
        return 1;
      default:
        return 0;
    }
  }

  static Color color(TaskPriority taskPriority) {
    switch (taskPriority) {
      case TaskPriority.high:
        return const Color.fromARGB(255, 130, 25, 179);
      case TaskPriority.normal:
        return Colors.orangeAccent;
      default:
        return Colors.blueAccent;
    }
  }
}
