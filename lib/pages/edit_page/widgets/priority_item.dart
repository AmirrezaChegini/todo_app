import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/task_priority_cubit.dart';
import 'package:todo_app/utils/constants.dart';

class PriorityItem extends StatelessWidget {
  const PriorityItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocBuilder<TaskPriorityCubit, int>(
      builder: (context, state) => GestureDetector(
        onTap: () {
          BlocProvider.of<TaskPriorityCubit>(context).choosePriority(index);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
          decoration: BoxDecoration(
            border: index == state
                ? Border.all(width: 2, color: Colors.black)
                : Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Text(
                Constants.priorityName[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Constants.priorityColor[index],
                radius: 7,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
