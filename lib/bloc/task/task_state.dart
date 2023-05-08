import 'package:todo_app/data/models/task.dart';

abstract class TaskState {}

class InitTaskState extends TaskState {}

class CompletedAllTaskState extends TaskState {
  List<Task> taskList;
  CompletedAllTaskState(this.taskList);
}
