import 'package:bloc/bloc.dart';
import 'package:todo_app/bloc/task/task_event.dart';
import 'package:todo_app/bloc/task/task_state.dart';
import 'package:todo_app/data/data_sources/task_datasource.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/di.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskDatasource _datasource = locator.get();

  List<Task> taskList = [];

  TaskBloc() : super(InitTaskState()) {
    on<GetAllTasksEvent>((event, emit) async {
      emit(InitTaskState());
      taskList = await _datasource.getAllTasks();
      emit(CompletedAllTaskState(taskList));
    });

    on<AddTaskEvent>((event, emit) async {
      await _datasource.addTask(event.task);
    });

    on<DeleteTaskEvent>((event, emit) async {
      await _datasource.deletetask(event.task);
    });

    on<DeleteAllTasksEvent>((event, emit) async {
      await _datasource.deleteAllTasks();
    });

    on<UpdateTaskEvent>((event, emit) async {
      await _datasource.updateTask(event.task);
    });
  }
}
