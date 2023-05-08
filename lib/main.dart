import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task/task_bloc.dart';
import 'package:todo_app/cubit/task_priority_cubit.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/init_db.dart';
import 'package:todo_app/pages/home_page/home_page.dart';

void main() async {
  await initLocator();
  await initDB();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => TaskPriorityCubit()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
