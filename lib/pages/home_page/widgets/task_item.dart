import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task/task_bloc.dart';
import 'package:todo_app/bloc/task/task_event.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/utils/get_task_priority.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.ontap,
    required this.task,
  });

  final Function() ontap;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        BlocProvider.of<TaskBloc>(context).add(DeleteTaskEvent(task));
        BlocProvider.of<TaskBloc>(context).add(GetAllTasksEvent());
      },
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Checkbox(
                value: task.complete,
                onChanged: (value) {
                  task.complete = value!;
                  BlocProvider.of<TaskBloc>(context).add(UpdateTaskEvent(task));
                  BlocProvider.of<TaskBloc>(context).add(GetAllTasksEvent());
                },
                shape: const CircleBorder(),
                activeColor: const Color.fromARGB(255, 130, 25, 179),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  task.text,
                  maxLines: 1,
                  style: TextStyle(
                    decoration: task.complete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 2,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 10,
                height: 70,
                decoration: BoxDecoration(
                  color: GetTaskPriority.color(task.taskPriority),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
