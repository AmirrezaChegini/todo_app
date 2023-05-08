import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task/task_bloc.dart';
import 'package:todo_app/bloc/task/task_event.dart';
import 'package:todo_app/cubit/task_priority_cubit.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/pages/edit_page/widgets/edit_appbar.dart';
import 'package:todo_app/pages/edit_page/widgets/priority_item.dart';
import 'package:todo_app/utils/get_task_priority.dart';
import 'package:todo_app/widgets/fab.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, this.task});

  final Task? task;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final FocusNode focusNode = FocusNode();
  late TextEditingController _edtCtrl;

  @override
  void initState() {
    super.initState();
    _edtCtrl = TextEditingController(text: widget.task?.text);
  }

  @override
  void dispose() {
    super.dispose();

    _edtCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const EditAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Fab(
        label: 'Save Changes',
        onTap: () {
          focusNode.unfocus();
          int state = BlocProvider.of<TaskPriorityCubit>(context).state;

          if (widget.task == null) {
            BlocProvider.of<TaskBloc>(context).add(AddTaskEvent(Task(
              _edtCtrl.text,
              false,
              GetTaskPriority.priority(state),
            )));
          } else {
            widget.task!.text = _edtCtrl.text;
            widget.task!.taskPriority = GetTaskPriority.priority(state);
            BlocProvider.of<TaskBloc>(context)
                .add(UpdateTaskEvent(widget.task!));
          }

          BlocProvider.of<TaskBloc>(context).add(GetAllTasksEvent());
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: List.generate(
                3,
                (index) => PriorityItem(index: index),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: TextField(
                  controller: _edtCtrl,
                  focusNode: focusNode,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 50,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add a task for today',
                    hintStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
