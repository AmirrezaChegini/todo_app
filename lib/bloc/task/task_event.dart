import 'package:todo_app/data/models/task.dart';

abstract class TaskEvent {}

class GetAllTasksEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  Task task;
  AddTaskEvent(this.task);
}

class DeleteTaskEvent extends TaskEvent {
  Task task;
  DeleteTaskEvent(this.task);
}

class DeleteAllTasksEvent extends TaskEvent {}

class UpdateTaskEvent extends TaskEvent {
  Task task;
  UpdateTaskEvent(this.task);
}
