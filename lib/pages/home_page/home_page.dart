import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task/task_bloc.dart';
import 'package:todo_app/bloc/task/task_event.dart';
import 'package:todo_app/bloc/task/task_state.dart';
import 'package:todo_app/cubit/task_priority_cubit.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/pages/edit_page/edit_page.dart';
import 'package:todo_app/pages/home_page/widgets/home_appbar.dart';
import 'package:todo_app/pages/home_page/widgets/task_item.dart';
import 'package:todo_app/utils/get_task_priority.dart';
import 'package:todo_app/widgets/fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskBloc>(context).add(GetAllTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: HomeAppBar(
        onChnaged: (value) {
          List<Task> taskList = BlocProvider.of<TaskBloc>(context).taskList;

          taskList = taskList
              .where((e) => e.text.toLowerCase().contains(value.toLowerCase()))
              .toList();
          BlocProvider.of<TaskBloc>(context)
              // ignore: invalid_use_of_visible_for_testing_member
              .emit(CompletedAllTaskState(taskList));
        },
      ),
      floatingActionButton: Fab(
        label: 'Add New Task',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          BlocProvider.of<TaskBloc>(context)
                              .add(DeleteAllTasksEvent());
                          BlocProvider.of<TaskBloc>(context)
                              .add(GetAllTasksEvent());
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete All'),
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 130, 25, 179),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  if (state is InitTaskState) {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                  if (state is CompletedAllTaskState) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.taskList.length,
                        (context, index) => TaskItem(
                          task: state.taskList[index],
                          ontap: () {
                            BlocProvider.of<TaskPriorityCubit>(context)
                                .choosePriority(
                              GetTaskPriority.index(
                                  state.taskList[index].taskPriority),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditPage(task: state.taskList[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
